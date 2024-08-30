import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';

void showSnackBar(String message, {bool? success}) {
  OneContext().showSnackBar(
      builder: (context) => SnackBar(
            showCloseIcon: true,
            closeIconColor: GlobalColors.white,
            dismissDirection: DismissDirection.horizontal,
            backgroundColor:
                success == true ? GlobalColors.green : GlobalColors.red,
            content: Text(
              message,
              style: CustomTextStyle.semiBold(
                  fontSize: 15.sp, color: GlobalColors.white),
            ),
            behavior: SnackBarBehavior.floating,
            margin: 25.w.padA,
          ));
}
