import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
      ref.read(profileProvider).organisationMembers;
      Future(() {
        fetchLinkFromAPI();
      });
    });
  }

  Future<Object> fetchLinkFromAPI() async {
    // Trigger the sendInvite method from ProfileProvider
    await ref
        .read(profileProvider.notifier)
        .generateInviteLink(orgId: '84118dd3-5a3b-4a32-8b45-6e5f0e5050ee');
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
      ),
      backgroundColor: GlobalColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppLocalizations.of(context)!.manageAccessToWorkspace,
              ),
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppLocalizations.of(context)!.inviteLink,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 16.94 / 14,
                    fontSize: 14,
                    color: GlobalColors.integrationTextColor),
              ),
              Text(AppLocalizations.of(context)!.inviteLinkDescr),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: GlobalColors.borderColor, width: 0.7)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start
                  children: [
                    Expanded(
                      child: asyncLinkValue.when(
                        data: (inviteLink) => Text(
                          inviteLink ?? "No link ",
                          softWrap: true,
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        error: (e, st) {
                          return Center(
                            child: Text(AppLocalizations.of(context)!
                                .errorFetchingLink),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              asyncLinkValue.whenData((link) {
                                if (link != null) {
                                  Share.share(link); // Share the link
                                }
                              });
                            },
                            icon: Icon(
                              Icons.share,
                              color: GlobalColors.orange,
                            )),
                        IconButton(
                            onPressed: () {
                              asyncLinkValue.whenData((link) {
                                if (link != null) {
                                  Clipboard.setData(ClipboardData(
                                      text: link)); // Copy the link
                                  showCustomToast(context,
                                      AppLocalizations.of(context)!.copyLink);
                                }
                              });
                            },
                            icon: Icon(
                              Icons.copy,
                              color: GlobalColors.orange,
                            ))
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
              SizedBox(
                height: 40,
                width: double.infinity,
                child: TextField(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.searchByNameOrEmail,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child:
                          Icon(Icons.search, color: GlobalColors.gray200Color),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: GlobalColors.borderColor,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    contentPadding: const EdgeInsets.only(top: 8.0),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
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
