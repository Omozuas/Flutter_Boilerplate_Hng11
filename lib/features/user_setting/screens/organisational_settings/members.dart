import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
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
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _membersController = TextEditingController();

  List<Members> organisationMembers = [
    /* Members(email: 'email@email', lastName: 'Shayor', firstName: 'Mofo'),
    Members(email: 'myemail@email', lastName: 'Kiki', firstName: 'Mush'),*/
  ];
  List<Members> filteredMembers = [];
  TextEditingController searchController = TextEditingController();
  String inviteLink = ''; // Variable to store the invitation link

  @override
  void initState() {
    super.initState();
    filteredMembers = organisationMembers;
    searchController.addListener(filterMembers);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getOrganisationMembers();
      ref.read(profileProvider.notifier).generateInviteLinkFromCurrentUser();
    });
  }

  void filterMembers() {
    final filter = searchController.text.toLowerCase();
    setState(() {
      filteredMembers = organisationMembers.where((member) {
        final firstName = (member.firstName ?? '').toLowerCase();
        final lastName = (member.lastName ?? '').toLowerCase();
        final email = (member.email ?? '').toLowerCase();
        return firstName.contains(filter) ||
            lastName.contains(filter) ||
            email.contains(filter);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _scrollController.dispose();
    _membersController.dispose();
    super.dispose();
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
        borderRadius: BorderRadius.circular(12.r),
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
              SizedBox(
                height: 39.h,
                width: 270.w,
                child: Text(
                  AppLocalizations.of(context)!.inviteLink,
                  style: CustomTextStyle.bold(
                    fontSize: 14.sp,
                    color: GlobalColors.integrationTextColor,
                  ),
                ),
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
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                        color: GlobalColors.borderColor, width: 0.7)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    SizedBox(
                      height: 39.w,
                      width: 270.w,
                      child: asyncLinkValue.when(
                        data: (inviteLink) => Scrollbar(
                          thumbVisibility: true,
                          thickness: 2.0.w,
                          controller: _scrollController,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Text(inviteLink ?? "No link ",
                                softWrap: true,
                                style: CustomTextStyle.medium(
                                  fontSize: 10.sp,
                                  color: GlobalColors.dark2,
                                )),
                          ),
                        ),
                        loading: () => Center(
                          child: SizedBox(
                              height: 15.h,
                              width: 15.h,
                              child:
                                  const CircularProgressIndicator.adaptive()),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 12,
              ),
              Divider(
                thickness: 1,
                color: GlobalColors.borderColor,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: searchController,
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
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 5.h,
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
                  if (organisationMembers.isEmpty) {
                    setState(() {
                      organisationMembers = members ?? [];
                      filteredMembers = organisationMembers;
                    });
                  }

                  return filteredMembers.isEmpty
                      ? Center(
                          child: Text(
                              '${context.noResultFound} "${searchController.text}"'))
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomAvatar(
                              memberDetail: filteredMembers[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                          itemCount: filteredMembers.length,
                        );
                },
              )
            ])),
      ),
    );
  }
}
