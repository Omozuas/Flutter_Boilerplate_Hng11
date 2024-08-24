import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text_style.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsOption({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.medium(
                  fontSize: 14.sp,
                  color: GlobalColors.dark2,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: CustomTextStyle.regular(
                  fontSize: 12.sp,
                  color: GlobalColors.mutedTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 25.0),
        Transform.scale(
          scale:
              0.60, // Adjust this value to scale the switch (1.0 is the original size)
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: GlobalColors
                .orange, // Replace with any color of choice if defined
            inactiveThumbColor: Colors.white,
            inactiveTrackColor:
                Colors.grey, // Replace with GlobalColors.inactive if defined
          ),
        ),
      ],
    );
  }
}
