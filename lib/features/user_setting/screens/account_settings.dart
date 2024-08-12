import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: 1.0), // Adjust this padding to align with the avatar
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                  ExpansionTile(
                    title: const Text(
                      'Profile Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    tilePadding: EdgeInsets.zero,
                    expandedAlignment: Alignment.centerLeft,
                    trailing: const Icon(Icons.expand_more, size: 24),
                    children: [
                      SettingsTile(
                        leadingIcon: Icons.person_outline,
                        title: 'General',
                        onTap: () {
                          // Navigate to General Settings
                        },
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
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ExpansionTile(
                    title: const Text(
                      'Organizational Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    tilePadding: EdgeInsets.zero,
                    expandedAlignment: Alignment.centerLeft,
                    trailing: const Icon(Icons.expand_more, size: 24),
                    children: [
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
                        },
                      ),
                      SettingsTile(
                        leadingIcon: Icons.security_outlined,
                        title: 'Roles and Permissions',
                        onTap: () {
                          // Navigate to Roles and Permissions Settings
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
                    ],
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
