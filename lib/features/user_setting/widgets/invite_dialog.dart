import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/invite_dialog_header.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class InviteDialog extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final String? title;
  final VoidCallback? onInvite;

  InviteDialog({
    super.key,
    this.title,
    this.onInvite,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: GlobalColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InviteDialogHeader(
              title: title,
              onClose: (){
                Navigator.pop(context);
              },
            ),
            const Divider(),
             const SizedBox(height: 16),

            // Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'email@example.com, email2@example.com...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Invite As Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Invite as',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              items: <String>['Admin', 'User', 'Guest'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle role selection change
              },
            ),

            // Invite Button
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: ElevatedButton(
            //     onPressed: onInvite ??
            //             () {
            //           // Handle invite logic here
            //           Navigator.pop(context);
            //         },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFFF97316),
            //       padding:
            //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //       minimumSize: const Size(93, 40),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(6),
            //       ),
            //     ),
            //     child: Text(
            //       'Invite',
            //       style: GoogleFonts.inter(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w500,
            //         height: 24 / 14,
            //         color: Colors.white,
            //       ),
            //       textAlign: TextAlign.left,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
