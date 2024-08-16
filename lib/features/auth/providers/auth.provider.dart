import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/auth_api.dart';
import 'package:flutter_boilerplate_hng11/features/auth/models/user_reg_data.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/reset_password.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_success.dart';
import 'package:flutter_boilerplate_hng11/services/response_model.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common_models/user.dart';
import '../../../services/service_locator.dart';

class AuthState {
  final bool normalButtonLoading;
  final bool googleButtonLoading;
  final bool checkBoxState;
  final User? user;

  AuthState(
      {required this.normalButtonLoading,
      required this.googleButtonLoading,
      required this.checkBoxState,
      this.user});

  AuthState copyWith(
      {bool? normalButtonLoading,
      bool? googleButtonLoading,
      bool? checkBoxState,
      User? user}) {
    return AuthState(
        normalButtonLoading: normalButtonLoading ?? this.normalButtonLoading,
        googleButtonLoading: googleButtonLoading ?? this.googleButtonLoading,
        checkBoxState: checkBoxState ?? this.checkBoxState,
        user: user ?? this.user);
  }
}

class AuthProvider extends StateNotifier<AuthState> {
  GetStorage box = locator<GetStorage>();
  AuthProvider()
      : super(AuthState(
            normalButtonLoading: false,
            googleButtonLoading: false,
            checkBoxState: false));

  set setNormalButtonLoading(bool value) {
    state = state.copyWith(normalButtonLoading: value);
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

  Future<void> registerSingleUser(
      Map<String, dynamic> data, BuildContext context) async {
    setNormalButtonLoading = true;
    try {
      final res = await AuthApi().registerSingleUser(data: data);

      if (res != null) {
        showSnackBar(res.message.toString());
        UserRegData userRegData = UserRegData.fromJson(res.data);
        setUser = User.fromJson(userRegData.data?['user']);
        if (context.mounted) {
          context.go(AppRoute.home);
          box.write('accessToken', userRegData.accessToken);
          box.write('email', data['email']);
          box.write('password', data['password']);
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

    //  FirebaseAuth auth = FirebaseAuth.instance;
    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      // final AuthCredential credential = GoogleAuthProvider.credential(
      //   idToken: googleAuth.idToken,
      //   accessToken: googleAuth.accessToken,
      // );
      //  final u = await auth.signInWithCredential(credential);
      final res = await AuthApi().googleSignIn(googleAuth.idToken!);
      if (res != null) {
        showSnackBar(res.message.toString());
        UserRegData userRegData = UserRegData.fromJson(res.data);
        setUser = User.fromJson(userRegData.data?['user']);

        if (context.mounted) {
          context.go(AppRoute.home);
          box.write('accessToken', userRegData.accessToken);
        }
      }
    }

    try {} catch (e) {
      rethrow;
    } finally {
      setGoogleButtonLoading = false;
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
        }
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    try {
      setNormalButtonLoading = true;
      final res = await AuthApi().forgotPassword(email: email);
      if (res != null) {
        showSnackBar(res.message.toString());
        setNormalButtonLoading = false;
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => VerificationScreen(email: email)));
          // context.go(AppRoute.verificationScreen);
        }
      }
    } catch (e) {
      //:TODO catch error
    }
  }

  Future<void> verifyCode(
      String email, String code, BuildContext context) async {
    try {
      final res = await AuthApi().verifyCode(email: email, code: code);
      if (res != null) {
        debugPrint(res.toString());
        showSnackBar(res.message.toString());

        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ResetPassword(
                      email: email,
                    )),
          );
          // context.go(AppRoute.verificationScreen);
        }
      }
    } catch (e) {
      //:TODO catch error
    }
    //:TODO catch error
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
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => const VerificationSuccessScreen()),
          );
          // context.go(AppRoute.verificationScreen);
        }
      }
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

