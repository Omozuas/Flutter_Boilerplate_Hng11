import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemberProfileScreen extends StatelessWidget {
  final Members memberDetail;
  final String? memberBio;

  const MemberProfileScreen({
    super.key,
    this.memberBio,
    required this.memberDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        elevation: 0,
        leading: const ChevronBackButton(),
        title: Text(
          AppLocalizations.of(context)!.memberProfile,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.manageAccessToWorkspace,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            // Profile Image with Edit Icon
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(memberDetail.avatarUrl ??
                      "https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b"),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: GlobalColors.white,
                    child: Icon(
                      Icons.camera_alt,
                      color: GlobalColors.iconColor2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Member Name and Email
            Text(
              memberDetail.firstName ??
                  AppLocalizations.of(context)!.memberName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              memberDetail.email ?? "member@gmail.com",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Member Bio
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.memberBio,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              memberBio ??
                  "A brief description about the member which might be long or short as the case maybe, you can choose to be personal funny or official ,your choice.",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            // Edit and Delete Profile Buttons
            CustomButton(
              onTap: () {},
              borderColor: GlobalColors.orange,
              text: AppLocalizations.of(context)!.editProfile,
              height: 50.0,
              containerColor: GlobalColors.orange,
              width: double.infinity,
              textColor: GlobalColors.white,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const DeleteMemberDialog();
                    });
              },
              borderColor: Colors.red,
              text: AppLocalizations.of(context)!.deleteProfile,
              height: 50.0,
              containerColor: GlobalColors.white,
              width: double.infinity,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
