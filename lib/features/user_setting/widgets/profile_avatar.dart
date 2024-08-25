import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../provider/profile_provider.dart';
import 'custom_network_image.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key, this.radius= 40.0, this.pickedImage});
  final XFile? pickedImage;
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(profileProvider).user;

    return CircleAvatar(
      radius: radius,
      child: pickedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.file(
                height: 80.0,
                width: 80.0,
                File(pickedImage!.path),
                fit: BoxFit.cover,
              ),
            )
          : Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/svg/account_settings/empty_avatar.svg',
                  // fit: BoxFit.cover,
                ),
                asyncUser.maybeWhen(
                  orElse: () => const SizedBox(),
                  error: (_, __) {
                    return const Center(
                      child: Text(
                        '',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                  data: (user) {
                    if (user?.avatarURL == null) {
                      return Center(
                        child: Text(
                          initials(user),
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: CustomNetworkImage(
                        size: const Size(80.0, 80.0),
                        url: user!.avatarURL!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }

  String initials([UserModel? user]) {
    try {
      var initials = '';
      if (user == null) return initials;
      if (user.fullname.isEmpty) return initials;

      final u = user.fullname.split(' ');
      if (u.length == 1) return u.first;
      return '${u[0][0]}${u[1][0]}';
    } catch (e) {
      return 'AN';
    }
  }
}
