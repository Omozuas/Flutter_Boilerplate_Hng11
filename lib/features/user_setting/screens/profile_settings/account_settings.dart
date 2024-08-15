import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/members.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/roles_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 18.0, top: 20.0), // Align with Profile Settings and bring it closer to the circle avatar
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: false, // Align title to the left
        automaticallyImplyLeading: false, // Remove the back arrow
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://link_to_image', // Replace with your actual image link or asset
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 19.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DesignKid',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff0A0A0A),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'engr.emmysammy1234@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff525252),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0), // Align with the icons below
                    child: Text(
                      'Profile Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SettingsTile(
                    leadingIcon: Icons.account_circle_outlined,
                    title: 'Account',
                    onTap: () {
                      // Navigate to Account Settings
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.notifications_outlined,
                    title: 'Notification',
                    onTap: () {
                      // Navigate to Notification Settings
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.lock_outline,
                    title: 'Data and Privacy',
                    onTap: () {
                      // Navigate to Data and Privacy Settings
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.language_outlined,
                    title: 'Language and Region',
                    onTap: () {
                      // Navigate to Language and Region Settings
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0), // Align with the icons below
                    child: Text(
                      'Organizational Setting',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SettingsTile(
                    leadingIcon: Icons.business_outlined,
                    title: 'Manage Organization',
                    onTap: () {
                      // Navigate to Manage Organization
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.people_outline,
                    title: 'Members',
                    onTap: () {
                      // Navigate to Members Settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MembersSettings(),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.security_outlined,
                    title: 'Roles and Permissions',
                    onTap: () {
                      // Navigate to Roles and Permissions Settings
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const RoleScreen();
                        },
                      ));
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.integration_instructions_outlined,
                    title: 'Integrations',
                    onTap: () {
                      // Navigate to Integrations Settings
                    },
                  ),
                  SettingsTile(
                    leadingIcon: Icons.payment_outlined,
                    title: 'Payment Information',
                    onTap: () {
                      // Navigate to Payment Information Settings
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ListTile(
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: const Icon(Icons.exit_to_app, color: Colors.red),
                    onTap: () {
                      // Handle Log Out action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
