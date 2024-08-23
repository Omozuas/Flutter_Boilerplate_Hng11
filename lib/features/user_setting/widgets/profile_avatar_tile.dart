import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/global_colors.dart';
import '../provider/profile_provider.dart';
import 'profile_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileAvatarTile extends ConsumerWidget {
  const ProfileAvatarTile({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImage = ref.watch(profileProvider).pickedImage;

    return GestureDetector(
      onTap: () async {
        final source = await _showPicker(context);
        await ref.watch(profileProvider.notifier).pickImage(source);
      },
      child: Row(
        children: [
          ProfileAvatar(pickedImage: pickedImage),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.uploadYourPhoto,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.orange,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.photoPurpose,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF525252),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<ImageSource?> _showPicker(BuildContext context) async {
    return showModalBottomSheet<ImageSource?>(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useRootNavigator: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      )),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () => Navigator.of(ctx).pop(ImageSource.camera),
                  child: Text(
                    'Take a picture',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF525252),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),
              Center(
                child: InkWell(
                  onTap: () => Navigator.of(ctx).pop(ImageSource.gallery),
                  child: Text(
                    'Pick from gallery',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF525252),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
