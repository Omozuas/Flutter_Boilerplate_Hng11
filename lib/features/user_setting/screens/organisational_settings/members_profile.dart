import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';

class MemberProfileScreen extends StatelessWidget {
  final String profileImageUrl;
  final String memberName;
  final String memberEmail;
  final String memberBio;

  const MemberProfileScreen({
    super.key,
    required this.profileImageUrl,
    required this.memberName,
    required this.memberEmail,
    required this.memberBio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Member Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image with Edit Icon
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: GlobalColors.white,
                    child: Icon(
                      Icons.camera_alt,
                      color: GlobalColors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Member Name and Email
            Text(
              memberName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              memberEmail,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Member Bio
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Member's Bio",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              memberBio,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            // Edit and Delete Profile Buttons
            CustomButton(
              onTap: () {
                // Handle Edit Profile
              },
              borderColor: GlobalColors.orange,
              text: 'Edit Profile',
              height: 50.0,
              containerColor: GlobalColors.orange,
              width: double.infinity,
              textColor: GlobalColors.white,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onTap: () {
                const DeleteMemberDialog();
              },
              borderColor: Colors.red,
              text: 'Delete Profile',
              height: 50.0,
              containerColor: Colors.transparent,
              width: double.infinity,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
