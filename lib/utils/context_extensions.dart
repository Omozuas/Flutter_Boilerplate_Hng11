import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get login => 'Login';
  String get editProfile => 'Edit Profile';
  String get profileUpdated => 'Profile Updated!';
  String get profileUpdatedMessage =>
      'Your profile has been successfully updated.';
  String get notification => 'Notification';
  String get passwordUpdated => 'Password Successfully Updated';
  String get passwordUpdatedMessage =>
      'Your password has been successfully updated! You can now log in with your new password.';
  String get passwordUpdatedError =>
      'Failed to update password. Please try again.';
  String get passwordUpdated404Error =>
      'The requested resource was not found. Please check the URL or contact support.';
  String get error => 'error';
  String get passwordUpdatedCatchError =>
      'An unexpected error occurred. Please try again.';
  String get passwordSetting => 'Password Setting';
  String get currentPassword => 'Current Password';
  String get enterCurrentPassword => 'Enter current password';
  String get language => 'Language';
  String get region => 'Region';
  String get timeZone => 'Time-Zone';
}
