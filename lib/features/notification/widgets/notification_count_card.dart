import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global_colors.dart';

class NotificationCountCard extends StatelessWidget {
  final int count;
  const NotificationCountCard({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 15.w.padL,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
          color: GlobalColors.lightOrange,
          borderRadius: BorderRadius.circular(2.r)),
      child: Text(
        count.toString(),
        style: GoogleFonts.outfit(
            fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
