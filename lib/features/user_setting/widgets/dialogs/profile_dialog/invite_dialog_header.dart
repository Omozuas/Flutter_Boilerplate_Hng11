import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteDialogHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onClose;

  const InviteDialogHeader({
    super.key,
    this.title,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: GlobalColors.deemWhiteColor,
          child: Text(
            "KP", // This can be dynamic based on user initials
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Title
        Expanded(
          child: Text(
            title ?? "Invite to your Organization",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 28 / 18,
              color: const Color(0xFF0F172A),
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: onClose ?? () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
