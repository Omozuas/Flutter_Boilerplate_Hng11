import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_notification_item.dart';
import '../../../../utils/widgets/custom_notification_section.dart';
import '../../../../utils/widgets/custom_snackbar.dart';
import '../../../auth/widgets/chevron_back_button.dart';
import '../../models/custom_api_error.dart';
import '../../models/notification_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/profile_dialog/profile_dialogs.dart';
import '../../widgets/ref_extension.dart';

import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

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
          context.notification,
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.sp),
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
                    sectionTitle:
                        AppLocalizations.of(context)!.notificationAlert,
                    notificationTiles: [
                      SettingsOption(
                        title: AppLocalizations.of(context)!
                            .mobilePushNotification,
                        description: AppLocalizations.of(context)!
                            .receivePushNotification,
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
                      sectionTitle:
                          AppLocalizations.of(context)!.emailNotification,
                      notificationTiles: [
                        SettingsOption(
                          title: AppLocalizations.of(context)!
                              .mobilePushNotification,
                          description: AppLocalizations.of(context)!
                              .receivePushNotification,
                          value: emailPushNotifications,
                          onChanged: (newValue) {
                            setState(() {
                              emailPushNotifications = newValue;
                            });
                          },
                        ),
                      ]),
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          onTap: _save,
          borderColor: GlobalColors.orange,
          text: AppLocalizations.of(context)!.saveChanges,
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
          title: AppLocalizations.of(context)!.notificationUpdated,
          description:
              AppLocalizations.of(context)!.notificationUpdatedSuccessfully,
          onContinue: () {
            Navigator.pop(ctx);
          },
        ),
      );
      if (!mounted) return;
      context.pop();
    } on CustomApiError catch (e) {
      showSnackBar(e.message);
    } catch (e) {
      showSnackBar(AppLocalizations.of(context)!.errorOccurred);
    }
  }
}
