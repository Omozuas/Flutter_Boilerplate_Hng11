import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchOrganizationDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onPress;

  const SwitchOrganizationDialog({
    super.key,
    this.title,
    this.description,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? context.switchTitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 28 / 18,
                color: const Color(0xff222222),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Text(
              description ?? context.switchDialogMessage,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 20 / 14,
                color: const Color(0xFF64748B),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 29,
                child: ElevatedButton(
                  onPressed: onPress ??
                          () {
                        Navigator.pop(context);
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF97316),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    context.confirmButton,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
