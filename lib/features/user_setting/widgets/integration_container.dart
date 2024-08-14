import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntegrationContainer extends StatelessWidget {
  const IntegrationContainer({
    super.key,
    required this.isToggled,
    this.onChanged,
    required this.image,
    required this.nameText,
    required this.detailText,
  });

  final bool isToggled;
  final Function(bool)? onChanged;
  final String image;
  final String nameText;
  final String detailText;

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 123.h,
          width: 342.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: GlobalColors.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(image, width: 32.w, height: 28.h),
                    Transform.scale(
                      scaleX: 1.1,
                      scaleY: .9,
                      child: CupertinoSwitch(
                        value: isToggled,
                        onChanged: onChanged,
                        activeColor: GlobalColors.orange,
                        thumbColor: GlobalColors.deemWhite,
                      ),
                    ),
                  ],
                ),
                Text(
                  nameText,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.black,
                  ),
                ),
                Text(
                  detailText,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.black,
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
