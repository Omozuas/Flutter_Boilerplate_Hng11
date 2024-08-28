import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

class Validators {
  static String? nameValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.nameRequired;
    }
    if (value.length < 2) {
      return context.nameTwoCharacters;
    }
    return null;
  }

  static String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.emailRequired;
    }
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(value)) {
      return context.emailValid;
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.passwordRequired;
    }
    if (value.length < 8) {
      return context.passwordEightCharacters;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return context.passwordUpperCase;
    }
    // if (!value.contains(RegExp(r'[a-z]'))) {
    //   return 'Password must contain at least one lowercase letter';
    // }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return context.passwordOneNumber;
    }
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|s<>]'))) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }
}
