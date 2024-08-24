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
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization

import '../../../../utils/widgets/custom_snackbar.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({
    super.key,
  });
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
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
          AppLocalizations.of(context)!.notification, // Localized title
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
                        sectionTitle: AppLocalizations.of(context)!.notificationsAlert, // Localized section title
                        notificationTiles: [
                          SettingsOption(
                            title: AppLocalizations.of(context)!.mobilePushNotifications, // Localized title
                            description: AppLocalizations.of(context)!.mobilePushNotificationsDescription, // Localized description
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
                        sectionTitle: AppLocalizations.of(context)!.emailNotifications, // Localized section title
                        notificationTiles: [
                          SettingsOption(
                            title: AppLocalizations.of(context)!.activityInYourWorkspace, // Localized title
                            description: AppLocalizations.of(context)!.activityInYourWorkspaceDescription, // Localized description
                            value: emailActivityWorkspace,
                            onChanged: (newValue) {
                              setState(() {
                                emailActivityWorkspace = newValue;
                              });
                            },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.alwaysSendEmailNotifications, // Localized title
                            description: AppLocalizations.of(context)!.alwaysSendEmailNotificationsDescription, // Localized description
                            value: sendEmailNotifications,
                            onChanged: (newValue) {
                              setState(() {
                                sendEmailNotifications = newValue;
                              });
                            },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.mobilePushNotifications, // Localized title
                            description: AppLocalizations.of(context)!.mobilePushNotificationsDescription, // Localized description
                            value: emailPushNotifications,
                            onChanged: (newValue) {
                                setState(() {
                                  emailPushNotifications = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.emailDigests, // Localized title
                            description: AppLocalizations.of(context)!.emailDigestsDescription, // Localized description
                            value: emailDigests,
                            onChanged: (newValue) {
                                setState(() {
                                  emailDigests = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.announcementUpdateEmail, // Localized title
                            description: AppLocalizations.of(context)!.announcementUpdateEmailDescription, // Localized description
                            value: announcementUpdateEmail,
                            onChanged: (newValue) {
                                setState(() {
                                  announcementUpdateEmail = newValue;
                                });
                              },
                          ),
                        ],
                      ),
                      CustomNotificationSection(
                        sectionTitle: AppLocalizations.of(context)!.slackNotifications, // Localized section title
                        notificationTiles: [
                          SettingsOption(
                            title: AppLocalizations.of(context)!.activityInYourWorkspace, // Localized title
                            description: AppLocalizations.of(context)!.activityInYourWorkspaceDescription, // Localized description
                            value: slackActivityWorkspace,
                            onChanged: (newValue) {
                                setState(() {
                                  slackActivityWorkspace = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.alwaysSendEmailNotifications, // Localized title
                            description: AppLocalizations.of(context)!.alwaysSendEmailNotificationsDescription, // Localized description
                            value: sendSlackNotifications,
                            onChanged: (newValue) {
                                setState(() {
                                  sendSlackNotifications = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.mobilePushNotifications, // Localized title
                            description: AppLocalizations.of(context)!.mobilePushNotificationsDescription, // Localized description
                            value: slackPushNotifications,
                            onChanged: (newValue) {
                                setState(() {
                                  slackPushNotifications = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.emailDigests, // Localized title
                            description: AppLocalizations.of(context)!.emailDigestsDescription, // Localized description
                            value: slackDigests,
                            onChanged: (newValue) {
                                setState(() {
                                  slackDigests = newValue;
                                });
                              },
                          ),
                          SettingsOption(
                            title: AppLocalizations.of(context)!.announcementUpdateEmail, // Localized title
                            description: AppLocalizations.of(context)!.announcementUpdateEmailDescription, // Localized description
                            value: announcementUpdateSlack,
                            onChanged: (newValue) {
                                setState(() {
                                  announcementUpdateSlack = newValue;
                                });
                              },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          onTap: _save,
          borderColor: GlobalColors.orange,
          text: AppLocalizations.of(context)!.saveChanges, // Localized button text
          height: 40.h,
          containerColor: GlobalColors.orange,
          loading: updateLoading,
          width: 139.h,
          textColor: GlobalColors.white,
        ),
      ),
    );
  }

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
          title: AppLocalizations.of(context)!.notificationUpdated, // Localized dialog title
          description: AppLocalizations.of(context)!.notificationUpdatedDescription, // Localized dialog description
          onContinue: () {
            Navigator.pop(ctx);
          },
        ),
      );
    } on CustomApiError catch (e) {
      showSnackBar(e.message);
    } catch (e) {
      showSnackBar(AppLocalizations.of(context)!.errorOccurred); // Localized error message
    }
  }
}
