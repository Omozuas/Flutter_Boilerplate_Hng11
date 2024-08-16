import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
                    backgroundImage: AssetImage(
                      'assets/images/avatar.png', // Replace with your actual image link or asset
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
                  const Text(
                    'Profile Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/personsettings.png',
                    title: 'Account',
                    onTap: () {
                      context.push(AppRoute.editProfileScreen);
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/notify.png',
                    title: 'Notification',
                    onTap: () {
                      context.push(AppRoute.notificationScreen);
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/data.png',
                    title: 'Data and Privacy ',
                    onTap: () {},
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/world.png',
                    title: 'Language and Region',
                    onTap: () {
                      // Navigate to Data and Privacy Settings
                      context.push(AppRoute.languageAndRegionScreen);
                    },
                  ),
                  SizedBox(height: 8.h),
                  const Divider(),
                  SizedBox(height: 8.h),
                  const Text(
                    'Organizational Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/org.png',
                    title: 'Manage Organization',
                    onTap: () {
                      // Navigate to Manage Organization
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/people.png',
                    title: 'Members',
                    onTap: () {
                      // Navigate to Members Settings
                      context.push(AppRoute.members);
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/notify.png',
                    title: 'Roles and Permissions',
                    onTap: () {
                      // Navigate to Roles and Permissions Settings
                      context.push(AppRoute.rolesScreen);
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/money.png',
                    title: 'Integrations',
                    onTap: () {
                      // Navigate to Integrations Settings
                    },
                  ),
                  SettingsTile(
                    leadingIcon: 'assets/images/wallet.png',
                    title: 'Payment Information',
                    onTap: () {
                      // Navigate to Payment Information Settings
                      context.push(AppRoute.subscriptionsScreen);
                    },
                  ),
                  SizedBox(height: 8.h),
                  const Divider(),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Log Out',
                          style:
                              TextStyle(color: GlobalColors.red, fontSize: 14),
                        ),
                        Icon(
                          Icons.logout_outlined,
                          color: GlobalColors.red,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
