import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get login => 'Login';

  String get nameRequired => "Name is required";
  String get nameTwoCharacters => "Name must be at least 2 characters long";
  String get emailRequired => "Email is required";
  String get emailValid => "Enter a valid email address";
  String get passwordRequired => "Password is required";
  String get passwordEightCharacters =>
      "Password must be at least 8 characters long";
  String get passwordUpperCase =>
      "Password must contain at least one uppercase letter";
  String get passwordOneNumber => "Password must contain at least one number";
}
