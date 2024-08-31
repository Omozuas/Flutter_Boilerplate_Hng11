import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpState {
  final bool isSigningUp;

  SignUpState({this.isSigningUp = false});
}

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(SignUpState());

  void startSignUp() {
    state = SignUpState(isSigningUp: true);
  }

  void finishSignUp() {
    state = SignUpState(isSigningUp: false);
  }
}

final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(),
);
