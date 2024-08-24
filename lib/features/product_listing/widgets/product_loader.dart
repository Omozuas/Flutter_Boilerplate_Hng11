import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_size.dart';
import '../../../utils/widgets/shimmer_loaders.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Container(
            height: GlobalScreenSize.getScreenHeight(context) * .156,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            width: GlobalScreenSize.getScreenWidth(context),
            padding: 10.w.padA,
            decoration: BoxDecoration(
                border: Border.all(color: GlobalColors.productBorderColor),
                borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    width: 104.w,
                    height: 104.h,
                    child: const ShimmerCard(),
                  ),
                ),
                14.w.sbW,
                Expanded(
                    child: SizedBox(
                  height: 104.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          small(height: 16.h, width: 50.w, padding: 4.sp.padB),
                          small(height: 14.h, width: 150.w, padding: 4.sp.padB),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          small(height: 16.h, width: 70.w, padding: 4.sp.padB),
                          small(
                            height: 14.h,
                            width: 200.w,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }

  small({double? height, double? width, EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding,
      height: height ?? 15.h,
      width: width ?? 50.w,
      child: const ShimmerCard(),
    );
  }
}
