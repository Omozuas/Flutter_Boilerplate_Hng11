import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/string_extensions.dart';
import '../utils/widget_extensions.dart';

class PriceWidget extends StatelessWidget {
  final num value;
  final double? size;
  final num? spaceSize;
  final Color? color;
  final String? family;
  final bool? roundUp;
  final bool isDollar;
  final bool isBold;
  final int decimalPlaces;
  final double? iconSize;
  final FontWeight? weight;
  const PriceWidget({
    super.key,
    this.value = 0,
    this.size,
    this.color,
    this.roundUp,
    this.family,
    this.isBold = false,
    this.weight,
    this.isDollar = true,
    this.decimalPlaces = 2,
    this.iconSize,
    this.spaceSize
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          isDollar? "\$" : "₦",
          style: GoogleFonts.inter(
            fontSize: iconSize?? size,
            fontWeight: isBold? FontWeight.w600: weight,
            color: color,
          ),
        ),
        spaceSize==null? 0.0.sbW: spaceSize!.sp.sbW,
        Text(
          formatNumber(value, roundUp: roundUp, decimalPlaces: decimalPlaces),
          style: GoogleFonts.inter(
            fontSize: size,
            fontWeight: isBold? FontWeight.w600: weight,
            color: color,
          ),
        )
      ],
    );
  }
}