import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:one_context/one_context.dart';

class Validators {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return OneContext().context!.nameRequired;
    }
    if (value.length < 2) {
      return OneContext().context!.nameTwoCharacters;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return OneContext().context!.emailRequired;
    }
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(value)) {
      return OneContext().context!.emailValid;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return OneContext().context!.passwordRequired;
    }
    if (value.length < 8) {
      return OneContext().context!.passwordEightCharacters;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return OneContext().context!.passwordUpperCase;
    }
    // if (!value.contains(RegExp(r'[a-z]'))) {
    //   return 'Password must contain at least one lowercase letter';
    // }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return OneContext().context!.passwordOneNumber;
    }
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|s<>]'))) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }
}
