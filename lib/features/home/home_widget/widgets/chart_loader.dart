import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/shimmer_loaders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartLoader extends StatelessWidget {
  const ChartLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: 302.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index){
                    return small();
                  }),
                ),
                10.w.sbW,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index){
                      return SizedBox(
                        height: 250.h,
                        width: 20.w,
                        child: const ShimmerCard(),
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget small() {
    return Container(
      padding: 8.sp.padH,
      height: 15.h,
      width: 50.w,
      child: const ShimmerCard(),
    );
}
}

class ChartEmpty extends StatelessWidget {
  const ChartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Sales and Trend yet",
            textAlign: TextAlign.center,
            style: CustomTextStyles.productTextBody3Black,

          )
        ],
      ),
    );
  }
}
