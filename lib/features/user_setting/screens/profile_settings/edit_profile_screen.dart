import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/empty_avatar_tile.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/pronouns_textfield_dropdown.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_expansion_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_social_textfield.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _departmentController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _xController = TextEditingController();
  final _instagramController = TextEditingController();
  final _linkedInController = TextEditingController();

  Pronouns? _pronouns;

  @override
  void dispose() {
    _usernameController.dispose();
    _jobTitleController.dispose();
    _departmentController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _xController.dispose();
    _instagramController.dispose();
    _linkedInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16),
        ),
        leading: InkWell(
          onTap: () {
            ///tODO: Perform onTap function for this icon
            context.pop();
          },
          child: Icon(
            Icons.chevron_left,
            size: 35.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmptyAvatarTile(
                  onTap: () {},
                ),
                SizedBox(height: 14.h),
                Text(
                  'Personal Details',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18.spMin),
                ),
                SizedBox(height: 8.w),
                CustomTextField(
                  label: 'Username',
                  controller: _usernameController,
                  hintText: 'Enter username',
                ),
                PronounsTextfieldDropdown(
                  initialValue: _pronouns,
                  onChanged: (pronoun) {
                    _pronouns = pronoun;
                  },
                ),
                CustomTextField(
                  label: 'Your job title',
                  controller: _jobTitleController,
                  hintText: 'Enter job title',
                ),
                CustomTextField(
                  label: 'Department or team',
                  controller: _departmentController,
                  hintText: 'Enter a department or team',
                ),
                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'Enter email address',
                ),
                CustomExpansionTile(
                  title: 'Bio',
                  content: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: '',
                          controller: _emailController,
                          hintText: 'Type your messsage here',
                          maxLines: 3,
                        ),
                        Text(
                          'Maximum of 64 characters',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomExpansionTile(
                  title: 'Connect Socials',
                  content: [
                    SocialMediaInput(
                      controller: _xController,
                      hintText: 'Add X link',
                      prefixIcon: Image.asset('assets/images/X logo.png'),
                    ),
                    SocialMediaInput(
                      controller: _instagramController,
                      hintText: 'Add Instagram link',
                      prefixIcon: Image.asset('assets/images/fe_instagram.png'),
                    ),
                    SocialMediaInput(
                      controller: _linkedInController,
                      hintText: 'Add Linkedin link',
                      prefixIcon:
                          Image.asset('assets/images/Instagram (2).png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderColor: GlobalColors.lightGray,
                          text: 'Cancel',
                          height: 40.h,
                          containerColor: Colors.white,
                          width: 50.w,
                          textColor: const Color(0xFF0F172A),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 12.h),
                      Expanded(
                        child: CustomButton(
                          borderColor: Colors.transparent,
                          text: 'Save Changes',
                          height: 40.h,
                          containerColor: GlobalColors.orange,
                          width: 50.w,
                          textColor: const Color(0xFFFAFAFA),
                          onTap: () {
                            showDialog(
                                context: (context),
                                builder: (BuildContext context) =>
                                    ProfileDialog(
                                      title: 'Profile Updated!',
                                      description:
                                          'Your profile has been successfully updated.',
                                      onContinue: () {
                                        Navigator.pop(context);
                                      },
                                    ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
