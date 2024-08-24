import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text_style.dart';
import '../global_colors.dart';

class CustomNotificationSection extends StatelessWidget {
  const CustomNotificationSection(
      {super.key,
      required this.sectionTitle,
      required this.notificationTiles,
      this.showDivider = true});

  final String sectionTitle;
  final List<Widget> notificationTiles;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: CustomTextStyle.semiBold(
            color: GlobalColors.dark2,
            fontSize: 18.sp,
          ),
        ),
        if (showDivider) Divider(color: GlobalColors.dividerColor),
        Column(
          children: notificationTiles,
        ),
      ],
    );
  }
}
