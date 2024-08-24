import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;

  /// Product texts are below
  String get productDescription => "Product Description";
  String get description => "Description";
  String get inStock => "In Stock";
}
