import 'package:intl/intl.dart';

String formatNumber(num number, {int? decimalPlaces, bool? roundUp}) {
  if (decimalPlaces != null && decimalPlaces < 0) {
    throw ArgumentError("decimalPlaces cannot be negative");
  }

  if (decimalPlaces != null && decimalPlaces == 0) {
    return roundUp != null && roundUp
        ? number.ceil().toString()
        : number.floor().toString();
  }

  final formatter = NumberFormat.decimalPattern();

  if (decimalPlaces != null) {
    formatter.minimumFractionDigits = decimalPlaces;
    formatter.maximumFractionDigits = decimalPlaces;
  }

  return roundUp != null && roundUp
      ? formatter.format(number)
      : formatter
          .format(double.parse(number.toStringAsFixed(decimalPlaces ?? 0)));
}
