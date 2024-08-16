// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../utils/validator.dart';
//
// class SignupFormState {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String password;
//   final String? firstNameError;
//   final String? lastNameError;
//   final String? emailError;
//   final String? passwordError;
//
//   const SignupFormState({
//     this.firstName = '',
//     this.lastName = '',
//     this.email = '',
//     this.password = '',
//     this.firstNameError,
//     this.lastNameError,
//     this.emailError,
//     this.passwordError,
//   });
//
//   SignupFormState copyWith({
//     String? firstName,
//     String? lastName,
//     String? email,
//     String? password,
//     String? firstNameError,
//     String? lastNameError,
//     String? emailError,
//     String? passwordError,
//   }) {
//     return SignupFormState(
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       firstNameError: firstNameError ?? this.firstNameError,
//       lastNameError: lastNameError ?? this.lastNameError,
//       emailError: emailError ?? this.emailError,
//       passwordError: passwordError ?? this.passwordError,
//     );
//   }
// }
//
// class SignupFormController extends StateNotifier<SignupFormState> {
//   SignupFormController() : super(const SignupFormState());
//
//   void updateFirstName(String value) {
//     state = state.copyWith(firstName: value, firstNameError: null);
//   }
//
//   void updateLastName(String value) {
//     state = state.copyWith(lastName: value, lastNameError: null);
//   }
//
//   void updateEmail(String value) {
//     state = state.copyWith(email: value, emailError: null);
//   }
//
//   void updatePassword(String value) {
//     state = state.copyWith(password: value, passwordError: null);
//   }
//
//   void validate() {
//     state = state.copyWith(
//       firstNameError: Validators.nameValidator(state.firstName),
//       lastNameError: Validators.nameValidator(state.lastName),
//       emailError: Validators.emailValidator(state.email),
//       passwordError: Validators.passwordValidator(state.password),
//     );
//   }
// }
//
// final signupFormProvider =
//     StateNotifierProvider<SignupFormController, SignupFormState>(
//         (ref) => SignupFormController());
//
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/features/auth/auth_api.dart';
import 'package:flutter_boilerplate_hng11/features/auth/models/user_reg_data.dart';
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
  UserService _userService = locator<UserService>();
  AuthProvider() : super(false);

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

  Future<void> login(Map<String, dynamic> data, BuildContext context) async {
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
          _userService.storeToken(userRegData.accessToken??"");
          getUser();
        }
      }
    } catch (e) {
      //TODO: Do something with caught error;
    } finally {
      state = false;
    }
  }

  Future<void> getUser() async {
    state = true;
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
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);

