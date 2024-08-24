import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../../../../utils/widgets/custom_expansion_tile.dart';
import '../../../../utils/widgets/custom_snackbar.dart';
import '../../../../utils/widgets/custom_text_field.dart';
import '../../../auth/widgets/chevron_back_button.dart';
import '../../models/user_model.dart';
import '../../models/user_profile.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/profile_dialog/profile_dialogs.dart';
import '../../widgets/profile_avatar_tile.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, this.user});
  final UserModel? user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstnameController;
  late final TextEditingController _lastnameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();

    final profile = widget.user?.profile;
    _firstnameController = TextEditingController(text: fullname.$1);
    _lastnameController = TextEditingController(text: fullname.$2);
    _usernameController = TextEditingController(text: profile?.username);
    _bioController = TextEditingController(text: profile?.bio);
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  (String, String) get fullname {
    final user = widget.user;
    if (user?.profile != null) {
      final fname = user?.profile?.firstname ?? '';
      final lname = user?.profile?.lastname ?? '';
      return (fname, lname);
    }

    final fullname = widget.user?.fullname.split(' ') ?? [];
    if (fullname.isEmpty) {
      return ('', '');
    }
    if (fullname.length == 1) {
      return (fullname.first, '');
    }
    final lastname = fullname.sublist(1).join(' ');
    return (fullname.first, lastname);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(profileProvider).profileUpdater.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        surfaceTintColor: Colors.transparent,
        titleSpacing: -6.sp,
        leading: const ChevronBackButton(),
        title: Text(
          context.text.editProfile,
          style: CustomTextStyle.semiBold(
            fontSize: 16.sp,
            color: GlobalColors.iconColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAvatarTile(onTap: () {}),
                SizedBox(height: 28.w),
                Text(
                  AppLocalizations.of(context)!.personalDetails,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18.spMin),
                ),
                SizedBox(height: 24.w),
                CustomTextField(
                  label: AppLocalizations.of(context)!.firstName,
                  controller: _firstnameController,
                  hintText: AppLocalizations.of(context)!.enterFirstName,
                ),
                CustomTextField(
                  label: AppLocalizations.of(context)!.lastName,
                  controller: _lastnameController,
                  hintText: AppLocalizations.of(context)!.enterLastName,
                ),
                CustomTextField(
                  label: AppLocalizations.of(context)!.username,
                  controller: _usernameController,
                  hintText: AppLocalizations.of(context)!.enterUsername,
                ),
                // SizedBox(height: 16.h),
                CustomExpansionTile(
                  space: 0,
                  horizontalTitlePadding: EdgeInsets.zero,
                  horizontalChildrenPadding: EdgeInsets.zero,
                  verticalChildrenPadding: EdgeInsets.zero,
                  verticalTitlePadding: EdgeInsets.zero,
                  title: AppLocalizations.of(context)!.bio,
                  content: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _bioController,
                          hintText:
                              AppLocalizations.of(context)!.typeYourMessageHere,
                          maxLines: 3,
                        ),
                        Text(
                          AppLocalizations.of(context)!.maximumOf64Character,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  borderColor: GlobalColors.orange,
                  text: AppLocalizations.of(context)!.saveChanges,
                  height: 40.h,
                  containerColor: GlobalColors.orange,
                  width: double.infinity,
                  textColor: const Color(0xFFFAFAFA),
                  loading: isLoading,
                  onTap: () {
                    if (isLoading) return;
                    update(widget.user);
                  },
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  borderColor: GlobalColors.lightGray,
                  text: AppLocalizations.of(context)!.cancel,
                  height: 40.h,
                  containerColor: Colors.white,
                  width: double.infinity,
                  textColor: const Color(0xFF0F172A),
                  onTap: context.pop,
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> update(UserModel? user) async {
    final pickedImage = ref.read(profileProvider).pickedImage;
    if (_firstnameController.text.isEmpty &&
        _lastnameController.text.isEmpty &&
        _usernameController.text.isEmpty &&
        _bioController.text.isEmpty &&
        pickedImage == null) {
      return;
    }
    if (user == null) return;

    final profile = UserProfile(
      userID: user.id,
      firstname: _firstnameController.text,
      lastname: _lastnameController.text,
      avatarURL: user.profile?.avatarURL,
      username: _usernameController.text,
      bio: _bioController.text,
    );
    try {
      await ref
          .read(profileProvider.notifier)
          .updateProfile(profile: profile, image: pickedImage);

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
      showSnackBar(AppLocalizations.of(context)!.errorOccurred);
    }
  }
}
