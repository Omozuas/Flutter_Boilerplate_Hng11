import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/roles_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_search_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateRole extends StatefulWidget {
  const CreateRole({super.key});

  @override
  State<CreateRole> createState() => _CreateRoleState();
}

class _CreateRoleState extends State<CreateRole> {
  final TextEditingController searchRolesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.createRole,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              )),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Custom roles let you group permissions and assign them to principals in your organization. You can manually select permissions or import permissions from another role.",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: GlobalColors.darkOne,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomSearchField(
              searchController: searchRolesController,
              hintText: AppLocalizations.of(context)!.search,
              leading: Image.asset("assets/icons/search_icon.png"),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              AppLocalizations.of(context)!.permissions,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: GlobalColors.darkTwo,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomDropdownButton(
              items: const ["item1", "item2", "item3", "item4"],
              borderColor: GlobalColors.borderColor,
              height: 40.h,
              containerColor: GlobalColors.white,
              width: double.infinity.w,
              textColor: GlobalColors.black,
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                onTap: () {
                  displayBottomsheet(context);
                },
                borderColor: GlobalColors.orange,
                text: "Add Premissions",
                height: 40.h,
                containerColor: GlobalColors.orange,
                width: 141.w,
                textColor: GlobalColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void displayBottomsheet(BuildContext context) {
    showBottomSheet(
        backgroundColor: GlobalColors.whiteColor,
        enableDrag: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Permissions',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: GlobalColors.darkTwo,
                        ),
                      ),
                      Text(
                        'See the list of permissions for this role.',
                        style: TextStyle(
                          color: GlobalColors.darkOne,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: GlobalColors.lightGray,
                ),
                SizedBox(
                  height: 15.h,
                ),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canViewTransactions),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canViewRefunds),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canLogRefunds),
                PermissionsListTile(
                    isPermitted: false,
                    permissionTitle:
                        AppLocalizations.of(context)!.canViewUsers),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canCreateUsers),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canEditUsers),
                PermissionsListTile(
                    isPermitted: true,
                    permissionTitle:
                        AppLocalizations.of(context)!.canBlacklist),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderColor: GlobalColors.lightGray,
                    text: "Save Preferences",
                    height: 40.h,
                    containerColor: GlobalColors.lightGray,
                    width: 150.w,
                    textColor: GlobalColors.darkTwo,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
