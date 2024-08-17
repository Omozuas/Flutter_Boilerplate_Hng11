import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/custom_api_error.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/notification_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/ref_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_notification_item.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_notification_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/widgets/custom_snackbar.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({
    super.key,
  });
  // final NotificationModel? notificationModel
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  //List to manage the state of each switch

  var mobilePushNotifications = false;

  var emailActivityWorkspace = false;
  var sendEmailNotifications = false;
  var emailPushNotifications = false;
  var emailDigests = false;
  var announcementUpdateEmail = false;

  var slackActivityWorkspace = false;
  var sendSlackNotifications = false;
  var slackPushNotifications = false;
  var slackDigests = false;
  var announcementUpdateSlack = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(profileProvider.notifier).getNotifications();
      final notif = ref.read(profileProvider).notificationFetch.sureValue;
      if (notif == null) return;

      mobilePushNotifications = notif.mobilePushNotifications!;

      emailActivityWorkspace = notif.activityWorkspaceEmail!;
      emailPushNotifications = notif.emailNotifications!;
      emailDigests = notif.emailDigests!;
      announcementUpdateEmail = notif.announcementsUpdateEmails!;

      slackActivityWorkspace = notif.activityWorkspaceSlack!;
      slackPushNotifications = notif.slackNotifications!;
      announcementUpdateSlack = notif.announcementsUpdateSlack!;
    });
  }

  // List<bool> toggleSwitches = ;
  @override
  Widget build(BuildContext context) {
    final updateLoading =
        ref.watch(profileProvider).notificationUpdater.isLoading;
    final notificationLoading =
        ref.watch(profileProvider).notificationFetch.isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        surfaceTintColor: Colors.transparent,
        titleSpacing: -6.sp,
        leading: const ChevronBackButton(),
        title: Text(
          'Notification',
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
      ),
      backgroundColor: GlobalColors.white,
      body: notificationLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
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
                            value: mobilePushNotifications,
                            onChanged: (newValue) {
                              setState(() {
                                mobilePushNotifications = newValue;
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
                              value: emailActivityWorkspace,
                              onChanged: (newValue) {
                                setState(() {
                                  emailActivityWorkspace = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Always send email notifications',
                              description:
                                  'Receive emails about activity in your workspace, even when you are active on the app',
                              value: sendEmailNotifications,
                              onChanged: (newValue) {
                                setState(() {
                                  sendEmailNotifications = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Mobile push notifications',
                              description:
                                  'Receive push notifications on mentions and comments via your mobile app',
                              value: emailPushNotifications,
                              onChanged: (newValue) {
                                setState(() {
                                  emailPushNotifications = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Email digests',
                              description:
                                  'Receive email digest every 8 hours for changes to pages you are subscribed to  ',
                              value: emailDigests,
                              onChanged: (newValue) {
                                setState(() {
                                  emailDigests = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Announcement and update emails',
                              description:
                                  'Receive occasional emails about product launches and new features from notion',
                              value: announcementUpdateEmail,
                              onChanged: (newValue) {
                                setState(() {
                                  announcementUpdateEmail = newValue;
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
                              value: slackActivityWorkspace,
                              onChanged: (newValue) {
                                setState(() {
                                  slackActivityWorkspace = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Always send email notifications',
                              description:
                                  'Receive emails about activity in your workspace, even when you are active on the app',
                              value: sendSlackNotifications,
                              onChanged: (newValue) {
                                setState(() {
                                  sendSlackNotifications = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Mobile push notifications',
                              description:
                                  'Receive push notifications on mentions and comments via your mobile app',
                              value: slackPushNotifications,
                              onChanged: (newValue) {
                                setState(() {
                                  slackPushNotifications = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Email digests',
                              description:
                                  'Receive email digest every 8 hours for changes to pages you are subscribed to  ',
                              value: slackDigests,
                              onChanged: (newValue) {
                                setState(() {
                                  slackDigests = newValue;
                                });
                              },
                            ),
                            SettingsOption(
                              title: 'Announcement and update emails',
                              description:
                                  'Receive occasional emails about product launches and new features from notion',
                              value: announcementUpdateSlack,
                              onChanged: (newValue) {
                                setState(() {
                                  announcementUpdateSlack = newValue;
                                });
                              },
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
      // asyncNotification.when(
      //   loading: () =>
      //       const Center(child: CircularProgressIndicator.adaptive()),
      //   error: (e, __) {
      //     var message = 'An error occurred';
      //     if (e is CustomApiError) {
      //       message = e.message;
      //     }
      //     print(e);
      //     return Center(
      //       child: Text(message),
      //     );
      //   },
      //   data: (notification) {
      //     if (notification != null) {
      //       return SizedBox();
      //     }
      //     return ;
      //   },
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          onTap: _save,
          borderColor: GlobalColors.orange,
          text: 'Save Changes',
          height: 40.h,
          containerColor: GlobalColors.orange,
          loading: updateLoading,
          width: 139.h,
          textColor: GlobalColors.white,
        ),
      ),
    );
  }

  // final
  Future<void> _save() async {
    try {
      await ref.read(profileProvider.notifier).updateNotifications(
            NotificationModel(
              userId: null,
              id: null,
              mobilePushNotifications: mobilePushNotifications,
              activityWorkspaceEmail: emailActivityWorkspace,
              emailNotifications: emailPushNotifications,
              emailDigests: emailDigests,
              announcementsUpdateEmails: announcementUpdateEmail,
              activityWorkspaceSlack: slackActivityWorkspace,
              slackNotifications: slackPushNotifications,
              announcementsUpdateSlack: announcementUpdateSlack,
            ),
          );

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (ctx) => ProfileDialog(
          title: 'Notification Updated',
          description:
              'Notification preferences updated successfully. Remember, you can always adjust these settings again later',
          onContinue: () {
            Navigator.pop(ctx);
          },
        ),
      );
    } on CustomApiError catch (e) {
      showSnackBar(e.message);
    } catch (e) {
      showSnackBar('An error occurred');
    }
  }
}
