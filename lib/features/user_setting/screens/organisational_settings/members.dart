import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/delete_member_dialog.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/invite_dialog.dart';
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
  // bool isInviteLinkActive = false;

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
      appBar: AppBar(
        title: Text(
          'Members',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: GlobalColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manage who has access to this workspace",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: GlobalColors.darkOne,
                ),
              ),
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Manage Members',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color(0xff0A0A0A)),
                  ),
                  const Spacer(),
                  CustomButton(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const InviteDialog();
                            });
                      },
                      borderColor: const Color(0xffF97316),
                      text: 'Invite people',
                      height: 31.h,
                      containerColor: const Color(0xffF97316),
                      width: 105.h,
                      textColor: const Color(0xffFFFFFF))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: TextField(
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: const Color(0xff525252)),
                      decoration: InputDecoration(
                        hintText: 'Search by name or email',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Icon(Icons.search,
                              color: GlobalColors.gray200Color),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffCBD5E1),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(),
                        contentPadding: const EdgeInsets.only(top: 8.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 13.w),
                ],
              ),
              SizedBox(height: 10.w),
              Row(
                children: [
                  Text(
                    '3 active members',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff525252)),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    offset: const Offset(0, 30),
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 35,
                    ),
                    onSelected: (value) {
                      // Handle the selected action here
                      if (value == 'delete') {
                        showDialog(
                          context: context,
                          builder: (context) => const DeleteMemberDialog(),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'delete',
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          height: 20,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 4.0,
                              ),
                              child: Text(
                                'Delete member',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff09090B),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
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
                  const Spacer(),
                  CustomDropdownButton(
                      initialValue: 'Admin',
                      items: const ['Admin', 'User', 'Guest'],
                      borderColor: Colors.transparent,
                      height: 40.h,
                      containerColor: Colors.white,
                      width: 90.w,
                      textColor: const Color(0xff525252)),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
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
                  const Spacer(),
                  CustomDropdownButton(
                      initialValue: 'Admin',
                      items: const ['Admin', 'User', 'Guest'],
                      borderColor: Colors.transparent,
                      height: 40.h,
                      containerColor: Colors.white,
                      width: 90.w,
                      textColor: const Color(0xff525252)),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
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
                  const Spacer(),
                  CustomDropdownButton(
                      initialValue: 'Admin',
                      items: const ['Admin', 'User', 'Guest'],
                      borderColor: Colors.transparent,
                      height: 40.h,
                      containerColor: Colors.white,
                      width: 90.w,
                      textColor: const Color(0xff525252)),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
