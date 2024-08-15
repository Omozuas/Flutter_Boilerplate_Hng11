import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/global_colors.dart';
import '../breaking_border_container.dart';

class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            itemCount,
            (index) => Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: GestureDetector(
                    onTap: () {
                      //add fxn to pick and add image functionality
                    },
                    child: BreakingBorderContainer(
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                        height: 67.h,
                        width: 83.w,
                        child: Icon(
                          Icons.add,
                          size: 18.sp,
                          color: GlobalColors.darkOne,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
