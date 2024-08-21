import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/widgets/custom_avatar.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_dropdown_button.dart';

class MembersSettings extends StatefulWidget {
  const MembersSettings({super.key});

  @override
  State<MembersSettings> createState() => _MembersSettingsState();
}

class _MembersSettingsState extends State<MembersSettings> {
  bool isInviteLinkActive = false;

  void showCustomToast(BuildContext context) {
    CustomToast.show(
      context,
      CustomToast(
        message: "Invite Sent Successfully",
        backgroundColor: GlobalColors.toastBgSurface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.green, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                    StringManager.members,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                StringManager.manageAccessToWorkspace,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: GlobalColors.lightGray,
                ),
              ),
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              SwitchListTile(
                value: isInviteLinkActive,
                onChanged: (bool value) {
                  setState(() {
                    isInviteLinkActive = value;
                  });
                },
                title: const Text(StringManager.inviteLink),
                subtitle: Text(
                  StringManager.inviteLinkDescr,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              // Add buttons for demonstration
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeleteMemberDialog(),
                  );
                },
                child: const Text(StringManager.showDeleteMemberDialog),
              ),
              ElevatedButton(
                onPressed: () => showCustomToast(context),
                child: const Text(StringManager.showCustomToast),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '3 active members',
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff525252)),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 0,
                    child: IconButton(
                      iconSize: 35,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded),
                    ),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  CustomAvatar(
                      profileEmailStyle: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff525252),
                      ),
                      profileNameStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff525252),
                      ),
                      padding: 0,
                      radius: 23,
                      profileName: 'Chad Bosewick',
                      profileEmail: 'ChadBoseW@gmail.com'),
                  const SizedBox(
                    width: 35,
                  ),
                  Flexible(
                    child: CustomDropdownButton(
                        initialValue: StringManager.admin,
                        items: const [StringManager.admin, StringManager.user, StringManager.guest],
                        borderColor: Colors.transparent,
                        height: 40.h,
                        containerColor: Colors.transparent,
                        width: 90.w,
                        textColor: const Color(0xff525252)),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 0,
                    child: IconButton(
                      iconSize: 35,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded),
                    ),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  CustomAvatar(
                      profileEmailStyle: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff525252),
                      ),
                      profileNameStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff525252),
                      ),
                      padding: 0,
                      radius: 23,
                      profileName: 'Chad Bosewick',
                      profileEmail: 'ChadBoseW@gmail.com'),
                  const SizedBox(
                    width: 35,
                  ),
                  Flexible(
                    child: CustomDropdownButton(
                        initialValue: StringManager.admin,
                        items: const [StringManager.admin, StringManager.user, StringManager.guest],
                        borderColor: Colors.transparent,
                        height: 40.h,
                        containerColor: Colors.transparent,
                        width: 90.w,
                        textColor: const Color(0xff525252)),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 0,
                    child: IconButton(
                      iconSize: 35,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded),
                    ),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  CustomAvatar(
                      profileEmailStyle: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff525252),
                      ),
                      profileNameStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff525252),
                      ),
                      padding: 0,
                      radius: 23,
                      profileName: 'Chad Bosewick',
                      profileEmail: 'ChadBoseW@gmail.com'),
                  const SizedBox(
                    width: 35,
                  ),
                  Flexible(
                    child: CustomDropdownButton(
                        initialValue: StringManager.admin,
                        items: const [StringManager.admin, StringManager.user, StringManager.guest],
                        borderColor: Colors.transparent,
                        height: 40.h,
                        containerColor: Colors.transparent,
                        width: 90.w,
                        textColor: const Color(0xff525252)),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    StringManager.exportMembersList,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color(0xff0A0A0A)),
                  ),
                  const Spacer(),
                  CustomButton(
                      onTap: () {},
                      borderColor: const Color(0xffF97316),
                      text: StringManager.exportCsv,
                      height: 31.h,
                      containerColor: const Color(0xffF97316),
                      width: 91.h,
                      textColor: const Color(0xffFFFFFF))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
               StringManager.exportCsvWithInfo,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff525252),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
