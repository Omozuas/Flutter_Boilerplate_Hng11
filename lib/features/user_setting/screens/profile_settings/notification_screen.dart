import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/context_extensions.dart';
import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_notification_item.dart';
import '../../../../utils/widgets/custom_notification_section.dart';
import '../../../../utils/widgets/custom_snackbar.dart';
import '../../../auth/widgets/chevron_back_button.dart';
import '../../models/notification_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/profile_dialog/profile_dialogs.dart';
import '../../widgets/ref_extension.dart';

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
  var emailPushNotifications = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(profileProvider.notifier).getNotifications();
      final notif = ref.read(profileProvider).notificationFetch.sureValue;
      if (notif == null) return;

      mobilePushNotifications = notif.mobilePushNotifications!;
      emailPushNotifications = notif.emailNotifications!;
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
          context.text.notification,
          style: CustomTextStyle.semiBold(
            fontSize: 16.sp,
            color: GlobalColors.iconColor,
          ),
        ),
      ),
      backgroundColor: GlobalColors.white,
      body: notificationLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomNotificationSection(
                    sectionTitle: context.text.notificationAlert,
                    notificationTiles: [
                      SizedBox(height: 20.h),
                      SettingsOption(
                        title: context.text.mobilePushNotification,
                        description: context.text.receivePushNotification,
                        value: mobilePushNotifications,
                        onChanged: (newValue) {
                          setState(() {
                            mobilePushNotifications = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomNotificationSection(
                    sectionTitle: context.text.emailNotification,
                    notificationTiles: [
                      SizedBox(height: 20.h),
                      SettingsOption(
                        title: context.text.activityInYourWorkspace,
                        description: context.text.alwaysSendEmailDescr,
                        value: emailPushNotifications,
                        onChanged: (newValue) {
                          setState(() {
                            emailPushNotifications = newValue;
                          });
                        },
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
          text: context.text.saveChanges,
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
      await ref
          .read(profileProvider.notifier)
          .updateNotifications(NotificationModel(
            userId: null,
            id: null,
            mobilePushNotifications: mobilePushNotifications,
            emailNotifications: emailPushNotifications,
          ));

      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (ctx) => ProfileDialog(
          title: context.text.notificationUpdated,
          description: context.text.notificationUpdatedSuccessfully,
          onContinue: () {
            Navigator.pop(ctx);
          },
        ),
      );
      if (!mounted) return;
      context.pop();
    } catch (e) {
      showSnackBar(context.text.errorOccurred);
    }
  }
}
