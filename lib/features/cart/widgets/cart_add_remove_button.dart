import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isAdd;
  const NewIconButton({super.key, required this.onPressed, required this.isAdd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFF97316)),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        height: 29.h,
        alignment: Alignment.center,
        width: 32.w,
        padding: 5.sp.padA,
        child: Icon(
         isAdd? CupertinoIcons.add: CupertinoIcons.minus,
          size: 18.sp,
          color: const Color(0xFFF97316)
        ),
      ),
    );
  }
}