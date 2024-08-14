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
                    'Members',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "Manage who has access to this workspace",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
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
                inactiveTrackColor: GlobalColors.borderColor,
                inactiveThumbColor: GlobalColors.white,
                activeColor: GlobalColors.white,
                activeTrackColor: GlobalColors.orange,
                title:  Text(
                    'Invite Link',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff525252),
                  ),
                ),
                subtitle: Text(
                  'This provides a unique URL that allows anyone to join your workspace',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff525252),
                  ),
                ),
              ),
              if (isInviteLinkActive)...[
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.refresh, color: GlobalColors.orange),
                                  onPressed: (){
                                    // Logic to refresh the invite link goes here
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.copy, color: GlobalColors.orange),
                                  onPressed: (){
                                    // Logic to copy the invite link goes here
                                  },
                                ),
                              ],
                            ),
                            hintText: 'https://www.figma.com/design/7hCSTNzQOJLj9aww6wEEd1/',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: GlobalColors.borderColor),
                            )
                          ),
                        )
                    )
                  ],
                ),
              ],
              Divider(
                color: GlobalColors.borderColor,
                thickness: 1.h,
              ),
              // Add buttons for demonstration
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) => const DeleteMemberDialog(),
              //     );
              //   },
              //   child: const Text('Show Delete Member Dialog'),
              // ),
              // ElevatedButton(
              //   onPressed: () => showCustomToast(context),
              //   child: const Text('Show Custom Toast'),
              // ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Manage Members',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color(0xff0A0A0A)),
                  ),
                  const Spacer(),
                  CustomButton(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return InviteDialog();
                          }
                        );
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
              Text(
                'On the Free plan all members in a workspace are administrators. Upgrade to a paid plan to add the ability to assign or remove administrator roles.',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff525252),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text(
                        'Go to Plans',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffF97316),
                        ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color:Color(0xffF97316),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by name or email',
                        prefixIcon: Icon(Icons.search, color: GlobalColors.gray200Color),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: GlobalColors.lightGray,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 05.w),
                  DropdownButton<String>(
                    dropdownColor: GlobalColors.white,
                    iconEnabledColor: GlobalColors.gray200Color,
                    value: 'All',
                    onChanged: (String? newValue) {},
                    items: <String>['All', 'Members', 'Suspended', 'Left workspace']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20.w),
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
                        initialValue: 'Admin',
                        items: const ['Admin', 'User', 'Guest'],
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
                        initialValue: 'Admin',
                        items: const ['Admin', 'User', 'Guest'],
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
                        initialValue: 'Admin',
                        items: const ['Admin', 'User', 'Guest'],
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
                    'Export Members List',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color(0xff0A0A0A)),
                  ),
                  const Spacer(),
                  CustomButton(
                      onTap: () {},
                      borderColor: const Color(0xffF97316),
                      text: 'Export CSV',
                      height: 31.h,
                      containerColor: const Color(0xffF97316),
                      width: 105.h,
                      textColor: const Color(0xffFFFFFF))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Export a CSV with information of all members of your team',
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
