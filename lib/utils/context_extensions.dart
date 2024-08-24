import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  String get signUpText => "Sign Up";
  String get seeMore => " See more";

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get login => 'Login';

  ///Auth texts
  String get continueWithGoogle => "Continue with Google";
  
  /// Product texts are below
  String get description => "Description";
  String get inStock => "In Stock";
  String get productDescription => "Product Description";
  String get addAProduct => "Add a Product";
  String get passwordSetting => 'Password Setting';
  String get editProfile => 'Edit Profile';
  String get notification => 'Notification';
  String get orderDetails => 'Order Details';
}
