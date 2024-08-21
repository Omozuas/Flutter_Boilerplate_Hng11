import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/invite_dialog_header.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';

class InviteDialog extends StatefulWidget {
  final String? title;
  final VoidCallback? onInvite;

  const InviteDialog({
    super.key,
    this.title,
    this.onInvite,
  });

  @override
  InviteDialogState createState() => InviteDialogState();
}

class InviteDialogState extends State<InviteDialog> {
  final TextEditingController emailController = TextEditingController();
  String? selectedRole;

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
              title: widget.title,
              onClose: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            const SizedBox(height: 16),

            // Email TextField
            CustomTextField(
              label: 'Email',
              hintText: 'email@example.com, email2@example.com...',
              controller: emailController,
              borderColor: GlobalColors.lightGray, // Match email border color
              focusedBorderColor: GlobalColors.orange, // Match focused color
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
