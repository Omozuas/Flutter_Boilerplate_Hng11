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

  String get welcomeBack => 'Welcome Back!';
  String get discover => 'Discover';
  String get searchProduct => "Search Product";
  String get product => "Products";
  String get noProductAvailable => "No products available.";
  String get plusTwentyThree => "+ 23 from last month";
  String get plusFourFromLastMonth => "+ 4 from last month";
  String get plusTwoFromLastMonth => "+ 2 from last month";
  String get unknownCustomer => 'Unknown Customer';
  String get noEmailProvided => 'No Email Provided';
  String get dashboard => 'Dashboard';
  String get thisMonthSummary => 'This Month\'s Summary';
  String get noSales => "No sales yet this month";
  String get recentSalesTitle => 'Recent Sales';
  String get addAMember => 'Add a member';
  String get totalProducts => 'Total Products';
  String get subscriptions => 'Subscriptions';
  String get totalMembers => 'Total Members';
  
}
