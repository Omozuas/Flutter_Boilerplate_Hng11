import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final String title, leadingIcon;
  final Widget? leading, trailing;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 3.w,
      contentPadding: EdgeInsets.all(0.h),
      leading: leading ??
          SvgPicture.asset(
            leadingIcon,
            height: 20.h,
            width: 20.w,
            // ignore: deprecated_member_use
            color: GlobalColors.grays,
          ),
      title: Text(
        title,
        style: CustomTextStyles.productTextBody2Black
            .copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
      onTap: onTap,
    );
  }
}
