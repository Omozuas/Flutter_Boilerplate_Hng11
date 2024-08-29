import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

=======
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_notification_item.dart';
import '../../../../utils/widgets/custom_notification_section.dart';
import '../../../../utils/widgets/custom_snackbar.dart';
import '../../models/notification_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/profile_dialog/profile_dialogs.dart';
import '../../widgets/ref_extension.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({
    super.key,
  });
>>>>>>> dev
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

<<<<<<< HEAD
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
=======
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
>>>>>>> dev
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle), 
      ),
      body: Center(
        child: _buildContent(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home, 
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: AppLocalizations.of(context)!.business, 
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: AppLocalizations.of(context)!.school, 
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
=======
      appBar: CustomAppBar.simpleTitle(
        titleText: context.notification,
        showDivider: false,
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
>>>>>>> dev
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return Text(AppLocalizations.of(context)!.homeContent); 
      case 1:
        return Text(AppLocalizations.of(context)!.businessContent); 
      case 2:
        return Text(AppLocalizations.of(context)!.schoolContent); 
      default:
        return Container();
=======
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
>>>>>>> dev
    }
  }
}
