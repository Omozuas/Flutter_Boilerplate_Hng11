import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText1;
  final String buttonText2;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const SubscriptionDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText1,
    required this.buttonText2,
    required this.onTap1,
    required this.onTap2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 28 / 18,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Text(
                message,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: onTap1,
                    borderColor: GlobalColors.lightGray,
                    text: buttonText1,
                    height: 40,
                    containerColor: GlobalColors.white,
                    width: 167,
                    textColor: GlobalColors.darkTwo,
                    textStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.darkTwo,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    onTap: onTap2,
                    borderColor: GlobalColors.orange,
                    text: buttonText2,
                    height: 40,
                    containerColor: GlobalColors.orange,
                    width: 155,
                    textColor: GlobalColors.white,
                    textStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
