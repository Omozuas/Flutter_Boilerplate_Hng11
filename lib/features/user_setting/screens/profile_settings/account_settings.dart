import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/profile_avatar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/ref_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../models/custom_api_error.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
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
      appBar: CustomAppBar.simpleTitle(
        titleText: context.text.settings,
        showDivider: false,
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
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
                                    style: CustomTextStyle.semiBold(
                                      fontSize: 16.sp,
                                      color: const Color(0xff0A0A0A),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    user?.email ?? '',
                                    style: CustomTextStyle.regular(
                                      fontSize: 12.sp,
                                      color: const Color(0xff525252),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0.h),
                          Text(
                            context.text.profileSettings,
                            style: CustomTextStyle.semiBold(
                              fontSize: 16.sp,
                              color: GlobalColors.iconColor,
                            ),
                          ),
                          SizedBox(height: 5.0.h),
                          SettingsTile(
                            leadingIcon: 'assets/icons/personSetting.svg',
                            title: context.text.account,
                            onTap: () {
                              context.push(AppRoute.editProfileScreen);
                            },
                          ),
                          SettingsTile(
                            leadingIcon: 'assets/icons/notifybelll.svg',
                            title: context.text.notification,
                            onTap: () {
                              context.push(AppRoute.notificationScreen);
                            },
                          ),
                          SettingsTile(
                            leadingIcon: 'assets/icons/db.svg',
                            title: context.text.changePassword,
                            onTap: () {
                              context.push(AppRoute.updatePassword);
                            },
                          ),
                          SettingsTile(
                            leadingIcon: 'assets/icons/world.svg',
                            title: context.text.languageAndRegion,
                            onTap: () {
                              // Navigate to Data and Privacy Settings
                              context.push(AppRoute.languageAndRegionScreen);
                            },
                          ),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 10.h),
                          Text(
                            context.text.organizationSettings,
                            style: CustomTextStyle.semiBold(
                              fontSize: 16.sp,
                              color: GlobalColors.iconColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SettingsTile(
                            leadingIcon: 'assets/icons/UserPlus.svg',
                            title: context.text.createOrganisation,
                            onTap: () {
                              // Navigate to Manage Organization
                              context.push(AppRoute.companySignUp);
                            },
                          ),
                          SettingsTile(
                            leadingIcon:
                                'assets/icons/fluent_organization-16-regular.svg',
                            title: context.text.manageOrganization,
                            onTap: () {
                              // Navigate to Manage Organization
                            },
                          ),
                          SettingsTile(
                            leadingIcon: 'assets/icons/Users.svg',
                            title: context.text.members,
                            onTap: () {
                              // Navigate to Members Settings
                              context.push(AppRoute.members);
                            },
                          ),
                          SettingsTile(
                            leadingIcon: 'assets/icons/wellet.svg',
                            title: context.text.paymentInformation,
                            onTap: () {
                              // Navigate to Payment Information Settings
                              context.push(AppRoute.subscriptionsScreen);
                            },
                          ),
                          SizedBox(height: 10.h),
                          const Divider(),
                          SizedBox(height: 10.h),
                          InkWell(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (ctx) => LogOutDialog(
                                  onTap: () async {
                                    final userService = locator<UserService>();
                                    await userService.logout();
                                    if (!ctx.mounted) return;
                                    Navigator.pop(ctx);
                                    if (!context.mounted) return;
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
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ],
                ),
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
