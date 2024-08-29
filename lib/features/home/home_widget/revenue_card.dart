import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/custom_text_style.dart';

class RevenueCard extends StatelessWidget {
  final String title;
  final String value;
  final String image;
  final String details;

  const RevenueCard({
    super.key,
    required this.title,
    required this.value,
    required this.image,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170.h,
        padding: EdgeInsets.all(10.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF7F7F7)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: 35.h,
              width: 35.w,
            ),
            Text(
              value,
              softWrap: true,
              style: CustomTextStyle.bold(
                fontSize: 18.sp,
                color: const Color(0xFF374151),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: CustomTextStyle.bold(
                      fontSize: 17.sp, color: GlobalColors.gray500Color),
                ),
                Text(
                  details,
                  style: CustomTextStyle.regular(
                      fontSize: 12.sp, color: const Color(0xFF71717A)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
