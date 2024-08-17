import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_expansion_tile.dart';
import '../../../../utils/widgets/custom_social_textfield.dart';
import '../../../../utils/widgets/custom_text_field.dart';
import '../../models/user_model.dart';
import '../../models/user_profile.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/profile_dialog/profile_dialogs.dart';
import '../../widgets/profile_avatar_tile.dart';
import '../../widgets/pronouns_textfield_dropdown.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel? user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _usernameController;
  late final TextEditingController _jobTitleController;
  late final TextEditingController _departmentController;
  late final TextEditingController _bioController;
  late final TextEditingController _xController;
  late final TextEditingController _instagramController;
  late final TextEditingController _linkedInController;

  Pronouns? _pronouns;

  @override
  void initState() {
    super.initState();

    final profile = widget.user?.profile;
    _usernameController = TextEditingController(text: profile?.username);
    _jobTitleController = TextEditingController(text: profile?.jobTitle);
    _departmentController = TextEditingController(text: profile?.department);
    _bioController = TextEditingController(text: profile?.bio);
    _xController = TextEditingController(text: profile?.twitterLink);
    _instagramController = TextEditingController(text: profile?.facebookLink);
    _linkedInController = TextEditingController(text: profile?.linkedInLink);
    _pronouns = profile?.pronoun == null
        ? null
        : Pronouns.fromString(profile!.pronoun!);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _jobTitleController.dispose();
    _departmentController.dispose();
    _bioController.dispose();
    _xController.dispose();
    _instagramController.dispose();
    _linkedInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(profileProvider).profileUpdater.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16),
        ),
        leading: const ChevronBackButton(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAvatarTile(
                  onTap: () {},
                ),
                SizedBox(height: 28.w),
                Text(
                  'Personal Details',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18.spMin),
                ),
                SizedBox(height: 24.h),
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
                SizedBox(height: 16.h),
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
                CustomExpansionTile(
                  title: 'Bio',
                  content: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _bioController,
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
                      prefixIcon: SvgPicture.asset(
                        'assets/images/svg/account_settings/x_logo.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SocialMediaInput(
                      controller: _instagramController,
                      hintText: 'Add Instagram link',
                      prefixIcon: SvgPicture.asset(
                        'assets/images/svg/account_settings/instagram.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SocialMediaInput(
                      controller: _linkedInController,
                      hintText: 'Add Linkedin link',
                      prefixIcon: SvgPicture.asset(
                        'assets/images/svg/account_settings/linkedin.svg',
                        fit: BoxFit.scaleDown,
                      ),
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
                          onTap: context.pop,
                        ),
                      ),
                      SizedBox(width: 12.h),
                      Expanded(
                        child: CustomButton(
                            borderColor: GlobalColors.orange,
                            text: 'Save Changes',
                            height: 40.h,
                            containerColor: GlobalColors.orange,
                            width: 50.w,
                            textColor: const Color(0xFFFAFAFA),
                            loading: isLoading,
                            onTap: () {
                              if (isLoading) return;
                              update(widget.user);
                            }),
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

  Future<void> update(UserModel? user) async {
    final pickedImage = ref.read(profileProvider).pickedImage;
    if (_usernameController.text.isEmpty &&
        _jobTitleController.text.isEmpty &&
        _departmentController.text.isEmpty &&
        _bioController.text.isEmpty &&
        _xController.text.isEmpty &&
        _pronouns == null &&
        pickedImage == null &&
        _instagramController.text.isEmpty &&
        _linkedInController.text.isEmpty) {
      return;
    }
    if (user == null) return;

    final profile = UserProfile(
      userID: user.id,
      firstname: user.profile?.firstname ?? '',
      lastname: user.profile?.lastname ?? '',
      phoneNumber: user.profile?.phoneNumber,
      avatarURL: user.profile?.avatarURL,
      username: _usernameController.text,
      pronoun: _pronouns?.title,
      jobTitle: _jobTitleController.text,
      bio: _bioController.text,
      department: _departmentController.text,
      facebookLink: _instagramController.text,
      twitterLink: _xController.text,
      linkedInLink: _linkedInController.text,
    );
    try {
      await ref.read(profileProvider.notifier).updateProfile(
          email: user.email, profile: profile, image: pickedImage);

      final pUpdater = ref.read(profileProvider).profileUpdater;
      if (pUpdater.hasError) throw pUpdater.error!;
      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (ctx) => ProfileDialog(
          title: 'Profile Updated!',
          description: 'Your profile has been successfully updated.',
          onContinue: () {
            Navigator.pop(ctx);
          },
        ),
      );
      if (!mounted) return;
      context.pop();
    } catch (e) {
      // handle error;
    }
  }
}
