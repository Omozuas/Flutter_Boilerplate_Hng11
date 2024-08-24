import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/organisation/organisation.provider.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/add_product_formfields.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

import '../../../../utils/widgets/custom_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/profile_provider.dart';

class MembersSettings extends ConsumerStatefulWidget {
  const MembersSettings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MembersSettingsState();
}

class _MembersSettingsState extends ConsumerState<MembersSettings> {
  List<Members> organisationMembers = [
    Members(),
  ];
  String inviteLink = ''; // Variable to store the invitation link

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final org = ref.watch(getOrganisationProvider);
      ref
          .read(profileProvider.notifier)
          .getOrganisationMembers(orgId: org.organisationId.toString());
      Future(() {
        fetchLinkFromAPI();
      });
    });
  }

  Future<Object> fetchLinkFromAPI() async {
    // Trigger the sendInvite method from ProfileProvider
    await ref
        .read(profileProvider.notifier)
        .generateInviteLinkFromCurrentUser();
    // final org = ref.watch(getOrganisationProvider);
    // await ref
    //     .read(profileProvider.notifier)
    //     .generateInviteLink(orgId: org.organisationId.toString());

    // Check the inviteResponse state
    final inviteResponse = ref.read(profileProvider).inviteLink;
    return inviteResponse;
  }

  void showCustomToast(BuildContext context, String message) {
    CustomToast.show(
      context,
      CustomToast(
        message: message,
        backgroundColor: GlobalColors.toastBgSurface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.green, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncMembersValue = ref.watch(profileProvider).organisationMembers;
    final asyncLinkValue = ref.watch(profileProvider).inviteLink;
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: AppLocalizations.of(context)!.members,
        showDivider: false,
      ),
      backgroundColor: GlobalColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppLocalizations.of(context)!.manageAccessToWorkspace,
                style: CustomTextStyle.regular(
                  fontSize: 13.sp,
                  color: GlobalColors.black400,
                ),
              ),
              SizedBox(height: 12.h),
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(AppLocalizations.of(context)!.inviteLink,
                  style: CustomTextStyle.bold(
                    fontSize: 14.sp,
                    color: GlobalColors.integrationTextColor,
                  )
                  // TextStyle(
                  //     fontWeight: FontWeight.w700,
                  //     height: 16.94 / 14,
                  //     fontSize: 14,
                  //     color: GlobalColors.integrationTextColor),
                  ),
              SizedBox(
                width: 276.w,
                child: Text(
                  AppLocalizations.of(context)!.inviteLinkDescr,
                  style: CustomTextStyle.regular(
                    fontSize: 12.sp,
                    color: GlobalColors.darkOne,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 61.h,
                width: double.infinity,
                // padding: const EdgeInsets.only(top: 8, left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: GlobalColors.borderColor, width: 0.7)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start
                  children: [
                    SizedBox(
                      height: 39.w,
                      width: 270.w,
                      child: asyncLinkValue.when(
                        data: (inviteLink) => Text(inviteLink ?? "No link ",
                            softWrap: true,
                            style: CustomTextStyle.medium(
                              fontSize: 10.sp,
                              color: GlobalColors.dark2,
                            )),
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        error: (e, st) {
                          return Center(
                            child: Text(
                                AppLocalizations.of(context)!.errorFetchingLink,
                                style: CustomTextStyle.medium(
                                  fontSize: 10.sp,
                                  color: GlobalColors.dark2,
                                )),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: InkWell(
                            onTap: () {
                              asyncLinkValue.whenData((link) {
                                if (link != null) {
                                  Share.share(link); // Share the link
                                }
                              });
                            },
                            child: SvgPicture.asset(
                                "assets/images/svg/shareIcon.svg"),
                          ),
                        ),
                        SizedBox(width: 5.5.w),
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: InkWell(
                              onTap: () {
                                asyncLinkValue.whenData((link) {
                                  if (link != null) {
                                    Clipboard.setData(ClipboardData(
                                        text: link)); // Copy the link
                                    showCustomToast(context,
                                        AppLocalizations.of(context)!.copyLink);
                                  }
                                });
                              },
                              child: SvgPicture.asset(
                                "assets/images/svg/copyIcon.svg",
                                fit: BoxFit.contain,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 1,
                color: GlobalColors.borderColor,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.searchByNameOrEmail,
                hintTextStyle: CustomTextStyle.regular(
                  fontSize: 14.sp,
                  color: GlobalColors.darkOne,
                ),
                prefixIcon: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/svg/searchIcon.svg",
                    fit: BoxFit.contain,
                  ),
                ),

                // TextField(
                //   style: GoogleFonts.inter(
                //     fontWeight: FontWeight.w400,
                //     fontSize: 15,
                //   ),
                //   decoration: InputDecoration(
                //     hintText: AppLocalizations.of(context)!.searchByNameOrEmail,
                //     prefixIcon: Padding(
                //       padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                //       child: SvgPicture.asset(
                //         "assets/images/svg/searchIcon.svg",
                //         fit: BoxFit.contain,
                //       ),
                //       // Icon(Icons.search, color: GlobalColors.gray200Color),
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: BorderSide(
                //         color: GlobalColors.borderColor,
                //       ),
                //     ),
                //     prefixIconConstraints: const BoxConstraints(),
                //     contentPadding: const EdgeInsets.only(top: 8.0),
                //   ),
                // ),
              ),
              SizedBox(
                height: 24.h,
              ),
              // const Divider(),
              const SizedBox(
                height: 5,
              ),
              asyncMembersValue.when(
                  loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                  error: (e, st) {
                    return Center(
                      child: Text(
                          AppLocalizations.of(context)!.errorFetchingMembers),
                    );
                  },
                  data: (members) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomAvatar(
                          memberDetail:
                              members?[index] ?? organisationMembers[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemCount: members?.length ?? organisationMembers.length,
                    );
                  })
            ])),
      ),
    );
  }
}
