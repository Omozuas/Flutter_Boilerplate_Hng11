import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/validator.dart';

class SignupFormState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;

  const SignupFormState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
  });

  SignupFormState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
  }) {
    return SignupFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}

class SignupFormController extends StateNotifier<SignupFormState> {
  SignupFormController() : super(const SignupFormState());

  void updateFirstName(String value) {
    state = state.copyWith(firstName: value, firstNameError: null);
  }

  void updateLastName(String value) {
    state = state.copyWith(lastName: value, lastNameError: null);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

  void validate() {
    state = state.copyWith(
      firstNameError: Validators.nameValidator(state.firstName),
      lastNameError: Validators.nameValidator(state.lastName),
      emailError: Validators.emailValidator(state.email),
      passwordError: Validators.passwordValidator(state.password),
    );
  }
}

final signupFormProvider =
    StateNotifierProvider<SignupFormController, SignupFormState>(
        (ref) => SignupFormController());

