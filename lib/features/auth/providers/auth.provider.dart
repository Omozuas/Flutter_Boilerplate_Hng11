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

class AuthProvider extends StateNotifier<bool> {
  GetStorage box = locator<GetStorage>();
  AuthProvider() : super(false);

  Future<void> registerSingleUser(
      Map<String, dynamic> data, BuildContext context) async {
    state = true;
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
      //TODO: Do something with caught error;
    } finally {
      state = false;
    }
  }

  Future<void> googleSignin(BuildContext context) async {
    state = true;
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
      state = false;
    }
  }

  Future<void> login(Map<String, dynamic> data, BuildContext context) async {
    state = true;
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
      //TODO: Do something with caught error;
    } finally {
      state = false;
    }
  }
}

//Forgot password
Future<void> forgotPassword(String email, BuildContext context) async {
  state = true;
  try {
    final res = await AuthApi().forgotPassword(email: email);

    if (res != null) {
      showSnackBar(res.message.toString());
      UserRegData userRegData = UserRegData.fromJson(res.data);
      if (context.mounted) {
        context.go(AppRoute.home);
        box.write('accessToken', userRegData.accessToken);
      }
    }
  } catch (e) {
    //TODO: Do something with caught error;
  } finally {
    state = false;
  }
}

// reset password
Future<void> resetPassword(
    String email, String otp, String newpassword, BuildContext context) async {
  state = true;
  try {
    final res = await AuthApi()
        .resetPassword(email: email, otp: otp, newpassword: newpassword);

    if (res != null) {
      showSnackBar(res.message.toString());
      UserRegData userRegData = UserRegData.fromJson(res.data);
      if (context.mounted) {
        context.go(AppRoute.home);
        box.write('accessToken', userRegData.accessToken);
      }
    }
  } catch (e) {
    //TODO: Do something with caught error;
  } finally {
    state = false;
  }
}

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) {
  return AuthProvider();
});

final checkBoxProvider = StateProvider<bool>((ref) => false);
