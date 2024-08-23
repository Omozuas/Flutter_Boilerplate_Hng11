import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/profile_avatar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/ref_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../models/custom_api_error.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await handleGetUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(profileProvider).user;
    final user = ref.watch(profileProvider).user.sureValue;

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 1.0), // Adjust this padding to align with the avatar
            child: Text(
              context.text.settings,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: asyncUser.maybeWhen(
        skipError: true,
        skipLoadingOnReload: true,
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        orElse: () {
          return RefreshIndicator.adaptive(
            onRefresh: ref.read(profileProvider.notifier).getUser,
            child: SingleChildScrollView(
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
                                  user?.profile?.username ??
                                      user?.fullname ??
                                      '',
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
                          context.text.profileSettings,
                          style:const  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/personsettings.png',
                          title:context.text.account,
                          onTap: () {
                            context.push(AppRoute.editProfileScreen);
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/notify.png',
                          title:context.text.notification,
                          onTap: () {
                            context.push(AppRoute.notificationScreen);
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/data.png',
                          title:context.text.dataAndPrivacy,
                          onTap: () {
                            context.push(AppRoute.updatePassword);
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/world.png',
                          title: context.text.languageAndRegion,
                          onTap: () {
                            // Navigate to Data and Privacy Settings
                            context.push(AppRoute.languageAndRegionScreen);
                          },
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 8.h),
                        Text(
                         context.text.organizationSettings,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/org.png',
                          title:context.text.manageOrganization,
                          onTap: () {
                            // Navigate to Manage Organization
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/people.png',
                          title:context.text.members,
                          onTap: () {
                            // Navigate to Members Settings
                            context.push(AppRoute.members);
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/notify.png',
                          title: context.text.rolesAndPermissions,
                          onTap: () {
                            // Navigate to Roles and Permissions Settings
                            context.push(AppRoute.rolesScreen);
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/money.png',
                          title:context.text.integrations,
                          onTap: () {
                            // Navigate to Integrations Settings
                          },
                        ),
                        SettingsTile(
                          leadingIcon: 'assets/images/wallet.png',
                          title:context.text.paymentInformation,
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
                               context.text.logOut,
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
            ),
          );
        },
      ),
    );
  }

  Future<void> handleGetUser() async {
    try {
      await ref.read(profileProvider.notifier).getUser();
    } on CustomApiError catch (e) {
      showSnackBar(e.message);
    } catch (e) {
      showSnackBar('An error occurred');
    }
  }
}
