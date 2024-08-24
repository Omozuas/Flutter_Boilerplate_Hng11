import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get signUpText => text.signUpText;
  String get seeMore => text.seeMore;
  String get login => text.login;
  String get editProfile => text.editProfile;
  String get profileUpdated => text.profileUpdated;
  String get profileUpdatedMessage => text.profileUpdatedMessage;
  String get notification => text.notification;
  String get passwordUpdated => text.passwordUpdated;
  String get passwordUpdatedMessage => text.passwordUpdatedMessage;
  String get passwordUpdatedError => text.passwordUpdatedError;
  String get passwordUpdated404Error => text.passwordUpdated404Error;
  String get error => text.error;
  String get passwordUpdatedCatchError => text.passwordUpdatedCatchError;
  String get passwordSetting => text.passwordSetting;
  String get currentPassword => text.currentPassword;
  String get enterCurrentPassword => text.enterCurrentPassword;
  String get language => text.language;
  String get region => text.region;
  String get timeZone => text.timeZone;

<<<<<<< HEAD
  String get nameRequired => text.nameRequired;
  String get nameTwoCharacters => text.nameTwoCharacters;
  String get emailRequired => text.emailRequired;
  String get emailValid => text.emailValid;
  String get passwordRequired => text.passwordRequired;
  String get passwordEightCharacters => text.passwordEightCharacters;
  String get passwordUpperCase => text.passwordUpperCase;
  String get passwordOneNumber => text.passwordOneNumber;
  String get productDescription => text.productDescription;
  String get addAProduct => text.addAProduct;
  String get orderDetails => text.orderDetails;
  String get noResultFound => text.noResultFound;
  String get continueWithGoogle => text.continueWithGoogle;
  String get description => text.description;
  String get inStock => text.inStock;

  String get deliveryText => 'Estimated Delivery on 26th Aug';
  String get deliveryDateText => 'Delivered on 19th Aug';
  String get deliveryDate => '20-Aug-2024';
  String get deliveryTime => '7:41 PM';
  String get orderNumberText => 'Order#:';
  String get orderText => 'Orders';

  String get logoutConfirmation => 'Are you sure you want to logout from this Device.';
=======
  String get productDescription => "Product Description";
  String get addAProduct => "Add a Product";
  String get passwordSetting => 'Password Setting';
  String get editProfile => 'Edit Profile';
  String get notification => 'Notification';
  String get orderDetails => 'Order Details';
  String get addProductFailure => 'Failed to add product:';
  String get productFormIncomplete => 'Please Complete form fill';
  String get ok => 'Ok';
  String get success => 'Success';
  String get addProductSuccessDescription => 'Product added successfully';
  String get anErrorOccured => 'An Error occured';
  String get title => 'Title';
  String get category => 'Category';
  String get description => 'Description';
  String get descriptionFieldHint => 'Maximum of 72 characters';
  String get standardPrice => 'Standard Price';
  String get quantity => 'Quantity';
  String get cancel => 'Cancel';
  String get add => 'Add';
>>>>>>> 6e04ab2 (fix: replace all hardcoded strings in add product screen)
}
