import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'price_text_widget.dart';

class CartPriceOption extends StatelessWidget {
  final String title;
  final num value;
  final double? paddingBottom;
  const CartPriceOption({
    super.key,
    required this.title,
    required this.value,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (paddingBottom ?? 16).h.padB,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
            ),
          ),
          const Spacer(),
          PriceWidget(
            value: value,
            weight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
