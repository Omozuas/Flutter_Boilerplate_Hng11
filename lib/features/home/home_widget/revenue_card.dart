import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isRevenue;
  final String percentageChange;

  const RevenueCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentageChange,
    this.isRevenue = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF7F7F7)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.productTextBody3Black.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: GlobalColors.gray500Color),
                ),
                isRevenue
                    ? Text('\$',
                        style: CustomTextStyles.productTextBody3Black.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black))
                    : 0.0.sbW,
              ],
            ),
            SizedBox(
              height: GlobalScreenSize.getScreenHeight(context) * 0.025,
            ),
            //Color(0xFF374151)
            Text(
              "${isRevenue ? "\$" : ""}$value",
              style: CustomTextStyles.productTextBody3Black.copyWith(
                color: GlobalColors.blackColor,
              ),
            ),
            SizedBox(
              height: GlobalScreenSize.getScreenHeight(context) * 0.008,
            ),
            Text(
              percentageChange,
              style: CustomTextStyles.productSmallBodyTextBlack
                  .copyWith(color: const Color(0xFF525252)),
            ),
          ],
        ),
      ),
    );
  }
}
