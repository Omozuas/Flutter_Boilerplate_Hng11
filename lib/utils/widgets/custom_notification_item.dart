import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      color: const Color(0xff525252),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale:
                0.50, // Adjust this value to scale the switch (1.0 is the original size)
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
      ),
    );
  }
}
