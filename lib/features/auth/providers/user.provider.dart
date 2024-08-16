import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/auth/models/user_reg_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user.provider.g.dart';

@Riverpod(keepAlive: true)
class UserRegStateProviderModel extends _$UserRegStateProviderModel {
  @override
  UserRegState build() {
    return UserRegState();
  }

  void updateUser(UserRegData user) {
    log('User provider called');
    log('user data ${user.data}');
    state = state.copyWith(userReg: user);
    log('current state ${state.userReg?.data}');
  }
}

class UserRegState {
  final UserRegData? userReg;

  UserRegState({this.userReg});

  UserRegState copyWith({UserRegData? userReg}) =>
      UserRegState(userReg: userReg ?? this.userReg);
}
