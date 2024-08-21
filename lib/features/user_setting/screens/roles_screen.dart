import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, right: 15.w, left: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                leading: const Icon(Icons.search_outlined),
                hintText: StringManager.search ,
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                elevation: const WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      side: BorderSide(color: GlobalColors.borderColor)),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringManager.roles,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontSize: 24.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                       StringManager.manageUserRoles,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              color: GlobalColors.darkOne,
                            ),
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      StringManager.createRole,
                      style:
                          TextStyle(color: GlobalColors.white, fontSize: 12.sp),
                    ),
                    icon: Icon(
                      Icons.add,
                      size: 14.sp,
                      color: GlobalColors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          GlobalColors.orange,
                        ),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)))),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: GlobalColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(6.r)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoleOptionWidget(
                      title:  StringManager.administrator,
                      subtitle:  StringManager.fullControl,
                      isSelected: true,
                    ),
                    RoleOptionWidget(
                      title:  StringManager.guest,
                      subtitle:  StringManager.limitedPermission,
                      isSelected: false,
                    ),
                    Divider(),
                    RoleOptionWidget(
                      title: StringManager.user,
                      subtitle:  StringManager.limitedControlAndLimitedPermissions,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: GlobalColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(6.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             StringManager.permissions,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                          ),
                          Text(
                            StringManager.listOfPermissions,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    PermissionsListTile(
                        isPermitted: true,
                        permissionTitle:  StringManager.canViewTransactions),
                    PermissionsListTile(
                        isPermitted: true, permissionTitle:  StringManager.canViewRefunds),
                    PermissionsListTile(
                        isPermitted: true, permissionTitle:  StringManager.canLogRefunds),
                    PermissionsListTile(
                        isPermitted: false, permissionTitle:  StringManager.canViewUsers),
                    PermissionsListTile(
                        isPermitted: true, permissionTitle: StringManager.canCreateUsers),
                    PermissionsListTile(
                        isPermitted: true, permissionTitle:  StringManager.canEditUsers),
                    PermissionsListTile(
                        isPermitted: true,
                        permissionTitle:  StringManager.canBlacklist),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PermissionsListTile extends StatefulWidget {
  bool isPermitted;
  final String permissionTitle;
  PermissionsListTile({
    super.key,
    required this.isPermitted,
    required this.permissionTitle,
  });

  @override
  State<PermissionsListTile> createState() => _PermissionsListTileState();
}

class _PermissionsListTileState extends State<PermissionsListTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.isPermitted,
      activeTrackColor: GlobalColors.orange,
      onChanged: (bool value) {
        setState(() {
          widget.isPermitted = value;
        });
      },
      title: Text(
        widget.permissionTitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: GlobalColors.darkOne),
      ),
    );
  }
}

class RoleOptionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const RoleOptionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: isSelected ? GlobalColors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r)),
      padding: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? GlobalColors.white : Colors.black,
                ),
          ),
          Text(subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isSelected ? GlobalColors.white : GlobalColors.darkOne,
                  )),
        ],
      ),
    );
  }
}
