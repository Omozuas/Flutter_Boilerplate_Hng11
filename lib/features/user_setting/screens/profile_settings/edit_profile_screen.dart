import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/empty_avatar_tile.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/pronouns_textfield_dropdown.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_expansion_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_social_textfield.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        centerTitle: false,
        title: const Text('Edit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmptyAvatarTile(
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 14.h),
                CustomExpansionTile(
                  title: 'Personal Details',
                  content: [
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
                  ],
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
                      prefixIcon: Image.asset('assets/images/instagram.png'),
                    ),
                    SocialMediaInput(
                      controller: _linkedInController,
                      hintText: 'Add Linkedin link',
                      prefixIcon: Image.asset('assets/images/linkedin.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: Custombutton(
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
                        child: Custombutton(
                          borderColor: Colors.transparent,
                          text: 'Save Changes',
                          height: 40.h,
                          containerColor: GlobalColors.orange,
                          width: 50.w,
                          textColor: const Color(0xFFFAFAFA),
                          onTap: () {},
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
