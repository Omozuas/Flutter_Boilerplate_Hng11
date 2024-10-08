import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get order => text.order;

  String get paid => text.paid;

  String get packaing => text.packaging;

  String get orderCreated => text.orderCreated;

  String get augustDate => text.augustDate;

  String get progress => text.progress;

  String get processing => text.processing;

  String get estimate => text.estimate;

  String get aug => text.aug;

  String get confirmShip => text.confirmShip;

  String get cusDetails => text.cusDetails;

  String get james => text.james;

  String get shippingDetails => text.shippingDetails;

  String get orderSumarry => text.orderSummary;

  String get subTotal => text.subTotal;

  String get dis => text.dis;

  String get shippingCost => text.shippingCost;

  String get tot => text.tot;

  String get resendInvoice => text.resendInvoice;

  String get orderDetails => text.orderDetails;

  String get signUpText => text.signUpText;

  String get seeMore => text.seeMore;

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

  String get noResultFound => text.noResultFound;

  String get continueWithGoogle => text.continueWithGoogle;

  String get description => text.description;

  String get inStock => text.inStock;

  String get orders => text.orders;

  String get home => text.home;

  String get logoutConfirmation => text.logoutConfirmation;

  String get addProductFailure => text.addProductFailure;

  String get productFormIncomplete => text.productFormIncomplete;

  String get ok => text.ok;

  String get success => text.success;

  String get addProductSuccessDescription => text.addProductSuccessDescription;

  String get anErrorOccured => text.anErrorOccured;

  String get title => text.title;

  String get category => text.category;

  String get descriptionFieldHint => text.descriptionFieldHint;

  String get standardPrice => text.standardPrice;

  String get quantity => text.quantity;

  String get cancel => text.cancel;

  String get add => text.add;

  String get descriptionPlaceholder => text.descriptionPlaceholder;

  String get welcomeBack => text.welcomeBack;

  String get discover => text.discover;

  String get searchProduct => text.searchProduct;

  String get product => text.product;

  String get noProductAvailable => text.noProductAvailable;

  String get plusTwentyThree => text.plusTwentyThree;

  String get plusFourFromLastMonth => text.plusFourFromLastMonth;

  String get plusTwoFromLastMonth => text.plusTwoFromLastMonth;

  String get unknownCustomer => text.unknownCustomer;

  String get noEmailProvided => text.noEmailProvided;

  String get dashboard => text.dashboard;

  String get thisMonthSummary => text.thisMonthSummary;

  String get noSales => text.noSales;

  String get recentSalesTitle => text.recentSalesTitle;

  String get addAMember => text.addAMember;

  String get totalProducts => text.totalProducts;

  String get subscriptions => text.subscriptions;

  String get totalMembers => text.totalMembers;

  String get selectIsRequired => text.selectIsRequired;

  String get logOutAfterUpdate => text.logOutAfterUpdate;

  String get correctCurrentPassword => text.correctCurrentPassword;

  String get notSameCurrentNewPassword => text.notSameCurrentNewPassword;
  String get typeYourMessageHere => text.typeYourMessageHere;
  String get maximumOf64Character => text.maximumOf64Character;

  String get deliveryText => text.deliveryText;
  String get deliveryDateText => text.deliveryDateText;
  String get deliveryDate => text.deliveryDate;
  String get deliveryTime => text.deliveryTime;
  String get orderNumberText => text.orderNumberText;
  String get yourProductsWillShowHere => text.yourProductsWillShowHere;
  String get somethingWentWrong =>text.somethingWentWrong;
  String get manageOrganization => 'Manage Organizations';
  String get keepTrack => 'Keep Track of your organizations here.';
  String get toggleSwitch => 'Click the toggle buttons to switch through organizations';
  String get jumia => 'Jumia';
  String get jumiaDomain => 'jumia.boilerplate.com';
  String get compad => 'Compad App';
  String get compadDomain => 'compadapp.boilerplate.com';
  String get slack => 'Slack';
  String get slackDomain => 'slack.boilerplate.com';
  String get faceBook => 'Facebook';
  String get faceBookDomain => 'facebook.boilerplate.com';
  String get switchButton => 'Switch';
  String get confirmButton => 'Confirm';
  String get switchDialogMessage => 'You\'re about to change your workspace to slack organization. This action will direct you to a different environment within the platform, where you can access resources, projects, and settings specific to that organization.';
  String get switchTitle => 'Switch Organization';


    String get pullToRefresh => 'Pull to refresh';


}
