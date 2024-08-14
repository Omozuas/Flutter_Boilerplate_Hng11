import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductVariationSection extends StatelessWidget {
  const ProductVariationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Variation",
            style: TextStyle(color: DetailColors.dark1, fontSize: 14.sp),
          ),
          SizedBox(height: 12.h),
          Row(
            children: List.generate(
              4,
              (index) => Container(
                margin: EdgeInsets.only(right: 12.w),
                height: 42.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: GlobalColors.orange.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
