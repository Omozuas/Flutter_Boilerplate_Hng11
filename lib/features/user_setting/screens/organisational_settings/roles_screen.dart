import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/widgets/custom_search_field.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                  searchController: searchController,
                  hintText: 'Search',
                  leading: Image.asset("assets/icons/search_icon.png"),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Roles',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontSize: 24.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Manage user roles for members',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 12.sp,
                                    color: GlobalColors.darkOne,
                                  ),
                        )
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.push(AppRoute.createRole);
                      },
                      label: Text(
                        'Create Role',
                        style: TextStyle(
                            color: GlobalColors.white, fontSize: 12.sp),
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
                        title: 'Administrator',
                        subtitle: 'Full control and full permissions.',
                        isSelected: true,
                      ),
                      RoleOptionWidget(
                        title: 'Guest',
                        subtitle: 'Full control and limited permissions.',
                        isSelected: false,
                      ),
                      Divider(),
                      RoleOptionWidget(
                        title: 'User',
                        subtitle: 'Limited control and limited permissions.',
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
                              'Permissions',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
                      const Divider(),
                      PermissionsListTile(
                          isPermitted: true,
                          permissionTitle: 'Can view transactions'),
                      PermissionsListTile(
                          isPermitted: true,
                          permissionTitle: 'Can view refunds'),
                      PermissionsListTile(
                          isPermitted: true,
                          permissionTitle: 'Can log refunds'),
                      PermissionsListTile(
                          isPermitted: false,
                          permissionTitle: 'Can view users'),
                      PermissionsListTile(
                          isPermitted: true,
                          permissionTitle: 'Can create users'),
                      PermissionsListTile(
                          isPermitted: true, permissionTitle: 'Can edit users'),
                      PermissionsListTile(
                          isPermitted: true,
                          permissionTitle: 'Can blacklist/whitelist users'),
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
