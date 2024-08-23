import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/auth_api.dart';
import 'package:flutter_boilerplate_hng11/features/auth/models/organisation/organisation.dart';
import 'package:flutter_boilerplate_hng11/features/auth/models/user_reg_data.dart';
import 'package:flutter_boilerplate_hng11/services/response_model.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common_models/user.dart';
import '../../../services/service_locator.dart';
import '../../../services/user.service.dart';

class AuthState {
  final bool normalButtonLoading;
  final bool googleButtonLoading;
  final bool checkBoxState;
  final bool passwordButtonLoading;
  final User? user;
  final List<Organisation> organisations;

  AuthState(
      {required this.normalButtonLoading,
      required this.googleButtonLoading,
      required this.checkBoxState,
      this.user,
      required this.passwordButtonLoading,
      this.organisations = const []});

  AuthState copyWith(
      {bool? normalButtonLoading,
      bool? googleButtonLoading,
      bool? checkBoxState,
      bool? passwordButtonLoading,
      List<Organisation>? organisations,
      User? user}) {
    return AuthState(
      normalButtonLoading: normalButtonLoading ?? this.normalButtonLoading,
      googleButtonLoading: googleButtonLoading ?? this.googleButtonLoading,
      passwordButtonLoading:
          passwordButtonLoading ?? this.passwordButtonLoading,
      checkBoxState: checkBoxState ?? this.checkBoxState,
      user: user ?? this.user,
      organisations: organisations ?? this.organisations,
    );
  }
}

class AuthProvider extends StateNotifier<AuthState> {
  GetStorage box = locator<GetStorage>();
  final UserService _userService = locator<UserService>();

  AuthProvider()
      : super(AuthState(
            normalButtonLoading: false,
            googleButtonLoading: false,
            passwordButtonLoading: false,
            checkBoxState: false));

  set setNormalButtonLoading(bool value) {
    state = state.copyWith(normalButtonLoading: value);
  }

  set setPasswordButtonLoading(bool value) {
    state = state.copyWith(passwordButtonLoading: value);
  }

  set setGoogleButtonLoading(bool value) {
    state = state.copyWith(googleButtonLoading: value);
  }

  set setCheckBoxState(bool value) {
    state = state.copyWith(checkBoxState: value);
  }

  set setUser(User u) {
    state = state.copyWith(user: u);
  }

  set setOrganizations(List<Organisation> organisations) {
    state = state.copyWith(organisations: organisations);
  }

  set addOrganisation(Organisation org) {
    state = state.copyWith(organisations: state.organisations..add(org));
  }

  Future<void> registerSingleUser(
      Map<String, dynamic> data, BuildContext context) async {
    setNormalButtonLoading = true;
    try {
      final res = await AuthApi().registerSingleUser(data: data);

      if (res != null) {
        showSnackBar(res.message.toString());
        UserRegData userRegData = UserRegData.fromJson(res.data);
        setUser = User.fromJson(userRegData.data?['user']);
        setOrganizations = (userRegData.data?['organisations'] as List?)
                ?.map<Organisation>(
                  (e) => Organisation.fromJson(e),
                )
                .toList() ??
            [];

        if (context.mounted) {
          context.go(AppRoute.home);
          box.write('accessToken', userRegData.accessToken);
          box.write('email', data['email']);
          box.write('password', data['password']);
          _userService.storeToken(userRegData.accessToken ?? "");
          await getUser();
        }
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<void> googleSignin(BuildContext context) async {
    setGoogleButtonLoading = true;

    try {
      final googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;

        

        

        final res = await AuthApi().googleSignIn(googleAuth.idToken??'');
        if (res != null) {
          showSnackBar(res.message.toString());
          UserRegData userRegData = UserRegData.fromJson(res.data);
          setUser = User.fromJson(userRegData.data?['user']);
          setOrganizations = (userRegData.data?['organisations'] as List?)
              ?.map<Organisation>(
                (e) => Organisation.fromJson(e),
          )
              .toList() ??
              [];

          if (context.mounted) {
            context.go(AppRoute.home);
            box.write('accessToken', userRegData.accessToken);
            _userService.storeToken(userRegData.accessToken ?? "");
            await getUser();
          }
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      setGoogleButtonLoading = false;
    }
  }

  Future<bool> loadStoredUser() async {
    try {
      final result = await _userService.getStoreUser();
      if (result != null) {
        setUser = User(
          id: result.id,
          avatarUrl: result.avatarUrl,
          firstName: result.fullname?.split(' ')[0],
          isSuperadmin: false,
        );

        setOrganizations = (result.organisations)
                ?.map<Organisation>(
                  (e) => Organisation(
                    organisationId: e.id,
                    name: e.name,
                    isOwner: e.ownerId == result.id,
                  ),
                )
                .toList() ??
            [];

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> login(Map<String, dynamic> data, BuildContext context,
      {bool fromLoginScreen = true}) async {
    setNormalButtonLoading = true;
    try {
      final res = await AuthApi().loginUser(data);

      if (res != null) {
        showSnackBar(res.message.toString());
        UserRegData userRegData = UserRegData.fromJson(res.data);
        setUser = User.fromJson(userRegData.data?['user']);
        setOrganizations = (userRegData.data?['organisations'] as List?)
                ?.map<Organisation>(
                  (e) => Organisation.fromJson(e),
                )
                .toList() ??
            [];
        if (context.mounted) {
          context.go(AppRoute.home);
          box.write('accessToken', userRegData.accessToken);
          box.write('email', data['email']);
          box.write('password', data['password']);
          if (fromLoginScreen) {
            if (state.checkBoxState) {
              box.write('rememberMe', true);
            } else {
              box.write('rememberMe', false);
            }
          }
          _userService.storeToken(userRegData.accessToken ?? "");
          await getUser();
        }
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<void> getUser() async {
    setNormalButtonLoading = true;
    try {
      final res = await AuthApi().getUser();
      if (res?.data != null) {
        _userService.storeUser(res?.data);
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    try {
      setPasswordButtonLoading = true;
      final res = await AuthApi().forgotPassword(email: email);
      if (res != null) {
        showSnackBar(res.message.toString());
        setPasswordButtonLoading = false;
        if (context.mounted) {
          context.push('/verificationScreen/$email');
        }
      }
    } catch (e) {
      //:TODO catch error
    }
  }

  Future<bool?> verifyCode(
      String email, String code, BuildContext context) async {
    try {
      final res = await AuthApi().verifyCode(email: email, code: code);

      if (res != null) {
        showSnackBar(res.message.toString());

        if (context.mounted) {
          context.replace('/resetPassword/$email');
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //:TODO catch error
    }
    return false;
  }

  Future<ResponseModel?> resetPassword(String email, String newPassword,
      String confirmNewPassword, BuildContext context) async {
    try {
      final res = await AuthApi().resetPassword(
          email: email,
          confirmNewPassword: confirmNewPassword,
          newPassword: newPassword);
      if (res != null) {
        debugPrint(res.toString());
        showSnackBar(res.message.toString());
        if (context.mounted) {
          context.replace(AppRoute.verificationSuccess);
          // context.go(AppRoute.verificationScreen);
        }
      }
      return null;
    } catch (e) {
      //:TODO catch error
    }
    return null;
  }
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);
