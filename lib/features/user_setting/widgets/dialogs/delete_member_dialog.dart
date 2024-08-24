import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteMemberDialog extends StatelessWidget {
  final String memberName;
  const DeleteMemberDialog({super.key, required this.memberName});

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
              AppLocalizations.of(context)!.deleteMember,
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
              "Are you sure you want to delete $memberName? All data will be permanently removed. This action cannot be undone.",
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderColor: GlobalColors.lightGray,
                  text: AppLocalizations.of(context)!.cancel,
                  height: 40,
                  containerColor: GlobalColors.white,
                  width: 80,
                  textColor: GlobalColors.darkTwo,
                ),
                const SizedBox(width: 8),
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    CustomToast.show(
                      context,
                      CustomToast(
                        message: AppLocalizations.of(context)!.removeMember,
                        backgroundColor: GlobalColors.toastBgSurface,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: GlobalColors.redColor, width: 2),
                      ),
                    );
                  },
                  borderColor: Colors.transparent,
                  borderColors: Colors.transparent,
                  text: AppLocalizations.of(context)!.deleteButton,
                  height: 40,
                  containerColor: GlobalColors.red,
                  width: 80,
                  textColor: GlobalColors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key, required this.onTap});
  final VoidCallback onTap;

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
              AppLocalizations.of(context)!.logOut,
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
              context.logoutConfirmation,
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderColor: GlobalColors.lightGray,
                  text: AppLocalizations.of(context)!.cancel,
                  height: 40,
                  containerColor: GlobalColors.white,
                  width: 80,
                  textColor: GlobalColors.darkTwo,
                ),
                const SizedBox(width: 8),
                CustomButton(
                  onTap: onTap,
                  borderColor: Colors.transparent,
                  text: AppLocalizations.of(context)!.logOut,
                  height: 40,
                  containerColor: GlobalColors.red,
                  width: 80,
                  textColor: GlobalColors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
