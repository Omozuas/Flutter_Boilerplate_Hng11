import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_notification_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../localization/strings.dart';
import '../../../utils/widgets/custom_notification_section.dart';

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
          },
          child: const Icon(Icons.chevron_left),
        ),
        title: Text(
            StringManager.languageAndRegion,
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
                  sectionTitle: StringManager.notificationAlert,
                  notificationTiles: [
                    SettingsOption(
                      title: StringManager.mobilePushNotification,
                      description:
                          StringManager.receivePushNotification,
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
                    sectionTitle: StringManager.emailNotification,
                    notificationTiles: [
                      SettingsOption(
                        title: StringManager.activityInYourWorkspace,
                        description:
                           StringManager.receiveActivityInYourWorkspace,
                        value: toggleSwitches[1],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[1] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.alwaysSendEmail,
                        description:
                            StringManager.alwaysSendEmailDescr,
                        value: toggleSwitches[2],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[2] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.mobilePushNotification,
                        description:
                           StringManager.receivePushNotification,
                        value: toggleSwitches[3],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[3] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.emailDigests,
                        description:
                            StringManager.receiveEmailDigests,
                        value: toggleSwitches[4],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[4] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.announcement,
                        description:
                            StringManager.receiveOccassionalEmails,
                        value: toggleSwitches[5],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[5] = newValue;
                          });
                        },
                      ),
                    ]),
                CustomNotificationSection(
                    sectionTitle: StringManager.slackNotifications,
                    notificationTiles: [
                      SettingsOption(
                        title: StringManager.activityInYourWorkspace,
                        description:
                            StringManager.receiveActivityInYourWorkspace,
                        value: toggleSwitches[6],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[6] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.alwaysSendEmail,
                        description:
                           StringManager.alwaysSendEmailDescr,
                        value: toggleSwitches[7],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[7] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.mobilePushNotification,
                        description:
                          StringManager.receivePushNotification,
                        value: toggleSwitches[8],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[8] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.emailDigests,
                        description:
                          StringManager.receiveEmailDigests,
                        value: toggleSwitches[9],
                        onChanged: (newValue) {
                          setState(() {
                            toggleSwitches[9] = newValue;
                          });
                        },
                      ),
                      SettingsOption(
                        title: StringManager.announcement,
                        description:
                            StringManager.receiveOccassionalEmails,
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
                                title:StringManager.notificationUpdated,
                                description:
                                   StringManager.notificationUpdatedSuccessfully,
                                onContinue: () {
                                  Navigator.pop(context);
                                },
                              ));
                    },
                    borderColor: GlobalColors.borderColor,
                    text: StringManager.saveChanges,
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
