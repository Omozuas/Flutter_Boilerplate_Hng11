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

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/features/auth/auth_api.dart';
import 'package:flutter_boilerplate_hng11/features/auth/models/user_reg_data.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../services/service_locator.dart';

class AuthState {
  final bool normalButtonLoading;
  final bool googleButtonLoading;
  final bool checkBoxState;

  AuthState({
    required this.normalButtonLoading,
    required this.googleButtonLoading,
    required this.checkBoxState,
  });

  // You can also add a copyWith method for easy state modification
  AuthState copyWith({
    bool? normalButtonLoading,
    bool? googleButtonLoading,
    bool? checkBoxState,
  }) {
    return AuthState(
      normalButtonLoading: normalButtonLoading ?? this.normalButtonLoading,
      googleButtonLoading: googleButtonLoading ?? this.googleButtonLoading,
      checkBoxState: checkBoxState ?? this.checkBoxState,
    );
  }
}

class AuthProvider extends StateNotifier<AuthState> {
  GetStorage box = locator<GetStorage>();
  AuthProvider() : super(AuthState(normalButtonLoading: false, googleButtonLoading: false,
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

  Future<void> registerSingleUser(
      Map<String, dynamic> data, BuildContext context) async {
    setNormalButtonLoading = true;
    try {
      final res = await AuthApi().registerSingleUser(data: data);

      //The set up is such that if the response is successful, res will not be null.
      //Otherwise it will be null. That is why I am checking.
      if (res != null) {
        showSnackBar(res.message.toString());
        UserRegData userRegData = UserRegData.fromJson(res.data);
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

    FirebaseAuth auth = FirebaseAuth.instance;

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
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final u = await auth.signInWithCredential(credential);

        log('ID Token: ${googleAuth.idToken}...u=$u');
        final res = await AuthApi().googleSignIn(googleAuth.idToken!);
        if (res != null) {
          showSnackBar(res.message.toString());
          UserRegData userRegData = UserRegData.fromJson(res.data);
          if (context.mounted) {
            context.go(AppRoute.home);
            box.write('accessToken', userRegData.accessToken);
          }
        }
      }
    } catch (e) {
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
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);

