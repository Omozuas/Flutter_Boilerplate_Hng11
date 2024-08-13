import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteMemberDialog extends StatelessWidget {
  const DeleteMemberDialog({super.key});

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
             "Delete Member",
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
             "Are you sure you want to delete Chad Bosewick ? All data will be permanently removed. This action cannot be undone.",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 20 / 14,
                color: const Color(0xFF64748B),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    borderColor: GlobalColors.lightGray,
                    text: "Cancel",
                    height: 40,
                    containerColor: GlobalColors.white,
                    width: 80,
                    textColor: GlobalColors.darkTwo),
                const SizedBox(width: 8,),
                CustomButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    borderColor: Colors.transparent,
                    text: "Delete",
                    height: 40,
                    containerColor: GlobalColors.red,
                    width: 80,
                    textColor: GlobalColors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
