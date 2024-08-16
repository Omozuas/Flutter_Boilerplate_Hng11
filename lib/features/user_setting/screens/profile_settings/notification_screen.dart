import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_notification_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/widgets/custom_notification_section.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  //List to manage the state of each switch
  List<bool> toggleSwitches = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    true
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        surfaceTintColor: Colors.transparent,
        titleSpacing: -6.sp,
        leading: GestureDetector(
          onTap: () {
            ///tODO: Perform onTap function for this icon
            context.pop();
          },
          child: const Icon(Icons.chevron_left),
        ),
        title: Text(
          'Language & Region',
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
      ),
      backgroundColor: GlobalColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            Column(
              children: [
                CustomNotificationSection(
                  sectionTitle: 'Notifications Alert',
                  notificationTiles: [
                    SettingsOption(
                      title: 'Mobile push notifications',
                      description:
                          'Receive push notifications on mentions and comments via your mobile app',
                      value: toggleSwitches[0],
                      onChanged: (newValue) {
                        setState(() {
                          toggleSwitches[0] = newValue;
                        });
                      },
                    ),
                  ],
                ),
                CustomNotificationSection(
                    sectionTitle: 'Email Notifications',
                    notificationTiles: [
                      SettingsOption(
                        title: 'Activity in your workspace',
                        description:
                            'Receive emails when you get comments, mentions, page invites, reminders, access requests, and property changes',
                        value: toggleSwitches[1],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[1] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Always send email notifications',
                        description:
                            'Receive emails about activity in your workspace, even when you are active on the app',
                        value: toggleSwitches[2],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[2] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Mobile push notifications',
                        description:
                            'Receive push notifications on mentions and comments via your mobile app',
                        value: toggleSwitches[3],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[3] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Email digests',
                        description:
                            'Receive email digest every 8 hours for changes to pages you are subscribed to  ',
                        value: toggleSwitches[4],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[4] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Announcement and update emails',
                        description:
                            'Receive occasional emails about product launches and new features from notion',
                        value: toggleSwitches[5],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[5] = newValue;
                          });
                        },
                      ),
                    ]),
                CustomNotificationSection(
                    sectionTitle: 'Slack Notifications',
                    notificationTiles: [
                      SettingsOption(
                        title: 'Activity in your workspace',
                        description:
                            'Receive emails when you get comments, mentions, page invites, reminders, access requests, and property changes',
                        value: toggleSwitches[6],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[6] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Always send email notifications',
                        description:
                            'Receive emails about activity in your workspace, even when you are active on the app',
                        value: toggleSwitches[7],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[7] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Mobile push notifications',
                        description:
                            'Receive push notifications on mentions and comments via your mobile app',
                        value: toggleSwitches[8],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[8] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Email digests',
                        description:
                            'Receive email digest every 8 hours for changes to pages you are subscribed to  ',
                        value: toggleSwitches[9],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[9] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: 'Announcement and update emails',
                        description:
                            'Receive occasional emails about product launches and new features from notion',
                        value: toggleSwitches[10],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[10] = newValue;
                          });
                        },
                      ),
                    ]),
              ],
            ),
            Positioned(
                right: 0,
                top: 0,
                child: CustomButton(
                    onTap: () {
                      showDialog(
                          context: (context),
                          builder: (BuildContext context) => ProfileDialog(
                                title: 'Notification Updated',
                                description:
                                    'Notification preferences updated successfully. Remember, you can always adjust these settings again later',
                                onContinue: () {
                                  Navigator.pop(context);
                                },
                              ));
                    },
                    borderColor: GlobalColors.borderColor,
                    text: 'Save Changes',
                    height: 40.h,
                    containerColor: GlobalColors.orange,
                    width: 139.h,
                    textColor: GlobalColors.white))
          ],
        ),
      ),
    );
  }
}
