import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/profile_avatar.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  GetStorage stotage = GetStorage();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(profileProvider).user;

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 1.0), // Adjust this padding to align with the avatar
            child: Text(
              AppLocalizations.of(context)!.settings,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: asyncUser.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (e, st) {
          return const Center(
            child: Text(
                'An error occurred while fetching the current user details'),
          );
        },
        data: (user) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileAvatar(),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.profile?.username ?? user?.fullname ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xff0A0A0A),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                user?.email ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff525252),
                                ),
                              ),
                            ],
                          ),
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
                      const SizedBox(height: 10.0),
                      Text(
                        AppLocalizations.of(context)!.profileSettings,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SettingsTile(
                        leadingIcon: 'assets/images/personsettings.png',
                        title: AppLocalizations.of(context)!.account,
                        onTap: () {
                          context.push(AppRoute.editProfileScreen);
                        },
                      ),
                      SettingsTile(
                        leadingIcon: 'assets/images/notify.png',
                        title: AppLocalizations.of(context)!.notification,
                        onTap: () {
                          context.push(AppRoute.notificationScreen);
                        },
                      ),
                      // SettingsTile(
                      //   leadingIcon: 'assets/images/data.png',
                      //   title: AppLocalizations.of(context)!.changePassword,
                      //   onTap: () {
                      //     context.push(AppRoute.updatePassword);
                      //   },
                      // ),
                      SettingsTile(
                        leadingIcon: 'assets/images/world.png',
                        title: AppLocalizations.of(context)!.languageAndRegion,
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
                      // SettingsTile(
                      //   leadingIcon: 'assets/images/user_plus.png',
                      //   title: AppLocalizations.of(context)!.createOrganisation,
                      //   onTap: () {
                      //     // Navigate to create organisation screen
                      //     context.push(AppRoute.companySignUp);
                      //   },
                      // ),
                      SettingsTile(
                        leadingIcon: 'assets/images/org.png',
                        title: AppLocalizations.of(context)!.manageOrganization,
                        onTap: () {
                          // Navigate to Manage Organization
                        },
                      ),
                      SettingsTile(
                        leadingIcon: 'assets/images/people.png',
                        title: AppLocalizations.of(context)!.members,
                        onTap: () {
                          // Navigate to Members Settings
                          context.push(AppRoute.members);
                        },
                      ),
                      SettingsTile(
                        leadingIcon: 'assets/images/wallet.png',
                        title: AppLocalizations.of(context)!.paymentInformation,
                        onTap: () {
                          // Navigate to Payment Information Settings
                          context.push(AppRoute.subscriptionsScreen);
                        },
                      ),
                      SizedBox(height: 8.h),
                      const Divider(),
                      SizedBox(height: 8.h),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => LogOutDialog(
                              onTap: () {
                                stotage.remove('accessToken');
                                Navigator.pop(ctx);
                                context.go(AppRoute.login);
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Log Out',
                              style: TextStyle(
                                  color: GlobalColors.red, fontSize: 14),
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
          );
        },
      ),
    );
  }
}
