import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/roles_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_search_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Create Role',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "Custom roles let you group permissions and assign them to principals in your organization. You can manually select permissions or import permissions from another role.",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: GlobalColors.darkOne,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomSearchField(
              searchController: searchRolesController,
              hintText: "Search",
              leading: Image.asset("assets/icons/search_icon.png"),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Permissions",
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
                  showDialog(
                    context: context,
                    builder: (context) => const AddPermissionsDialog(),
                  );
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
}

class AddPermissionsDialog extends StatelessWidget {
  const AddPermissionsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      backgroundColor: GlobalColors.white,
      child: Container(
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
                isPermitted: true, permissionTitle: 'Can view transactions'),
            PermissionsListTile(
                isPermitted: true, permissionTitle: 'Can view refunds'),
            PermissionsListTile(
                isPermitted: true, permissionTitle: 'Can log refunds'),
            PermissionsListTile(
                isPermitted: false, permissionTitle: 'Can view users'),
            PermissionsListTile(
                isPermitted: true, permissionTitle: 'Can create users'),
            PermissionsListTile(
                isPermitted: true, permissionTitle: 'Can edit users'),
            PermissionsListTile(
                isPermitted: true,
                permissionTitle: 'Can blacklist/whitelist users'),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: CustomButton(
                onTap: () {},
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
      ),
    );
  }
}
