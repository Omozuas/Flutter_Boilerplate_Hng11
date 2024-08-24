import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Create a string getter here and call it in your ui using "context.{your-string-name}
// E.g
// String get login => 'Login';
// In your UI, use this : context.login (importing this context_extension file);

  String get login => 'Login';
  String get order => 'Order';
  String get paid => 'Paid';
  String get packaing => 'Packaging';
  String get orderCreated => 'Order Created';
  String get augustDate => 'August 16th, 2024 at 10:30 pm';
  String get progress =>  "Progress";
  String get processing =>  'Processing';
  String get estimate =>   'Estimated Shipping Date: ';
  String get aug =>  'Aug 20, 2024 ';
  String get confirmShip =>  "Confirm Shipment";
  String get cusDetails =>  "Customer Details";
  String get james =>  "James Hung Ltd";
  String get shippingDetails =>   "Shipping Details";
  String get orderSumarry =>   "Order Summary";
  String get subTotal =>  "Sub Total";
  String get dis =>  "Discount";
  String get shippingCost =>  "Shipping Cost";
  String get tot =>  "Total";
  String get resendInvoice =>  "Resend Invoice";
  String get orderDetails =>  "Order Details";

}
