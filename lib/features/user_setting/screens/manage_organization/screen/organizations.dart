import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/organization_widget.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/manage_organization_provider.dart';

class ManageUserOrganizations extends ConsumerWidget {
  const ManageUserOrganizations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final organizationManageProvider = ref.read(manageOrgBoardProvider);
    final organizationProvider = ref.watch(manageOrgBoardProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: context.manageOrganization,
        showDivider: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Text(
                  context.keepTrack,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: GlobalColors.blackColor),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: const EdgeInsets.only(left: 90, right: 90),
                  child: Text(
                    context.toggleSwitch,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff999999)),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                organizationProvider.userService.selectedOrganization != null ?  OrganizationWidget(
                  name:organizationProvider.userService.selectedOrganization?.name??"",
                  domain: organizationProvider.userService.selectedOrganization?.email??"",
                  isCurrentOrg: true
                ) : SizedBox(
                  height: 77.h,
                  width: width(context),
                  child: const Center(
                    child: Text("No Selected Organization"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: organizationManageProvider.initialLoading?
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, i){
                    return const OrganizationLoadingWidget();
                  }
              ):
              ListView.builder(
                itemCount: organizationManageProvider.allOrganizations.length,
                itemBuilder: (_, i){
                  return OrganizationWidget(
                    name: organizationManageProvider.allOrganizations[i].name??"",
                    domain: organizationManageProvider.allOrganizations[i].name??"",
                    onTap:()=> organizationProvider.switchOrg(context,  organizationManageProvider.allOrganizations[i]),
                    isCurrentOrg:  organizationManageProvider.allOrganizations[i].id == organizationProvider.userService.selectedOrganization?.id
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

