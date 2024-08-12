import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onContinue;

  const ProfileDialog({
    Key? key,
    this.title,
    this.description,
    this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Profile Updated!",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 28 / 18,
                color: const Color(0xFF0F172A),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            Text(
              description ?? "Your profile has been successfully updated.",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 20 / 14,
                color: const Color(0xFF64748B),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onContinue ??
                        () {
                      Navigator.pop(context);
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF97316),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: const Size(93, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 24 / 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
