import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_models/get_user_response.dart';
import '../models/user_model.dart';
import '../provider/profile_provider.dart';
import 'custom_network_image.dart';

class ProfileAvatar extends ConsumerWidget {
  final double? size;
  final AuthUser? user;
  const ProfileAvatar({super.key,this.user, this.pickedImage, this.size});
  final XFile? pickedImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(profileProvider).user;

    return CircleAvatar(
      radius: size!=null? ((size??0)/2): 40.0,
      child: pickedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(size!=null? ((size??0)/2): 40.0),
              child: Image.file(
                height: size?? 80.0,
                width: size??  80.0,
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
                if(user != null)
                  Container(
                    child: user?.avatarUrl == null? Center(
                      child: Text(
                        initial(user),
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ): ClipRRect(
                      borderRadius: BorderRadius.circular(size!=null? ((size??0)/2): 40.0),
                      child: CustomNetworkImage(
                        size: Size(size?? 80.0,size?? 80.0),
                        url: user?.avatarUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  )
                else
                asyncUser.maybeWhen(
                  orElse: () => const SizedBox(),
                  error: (_, __) {
                    return const Center(
                      child: Text(
                        'AN',
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
                      borderRadius: BorderRadius.circular(size!=null? ((size??0)/2): 40.0),
                      child: CustomNetworkImage(
                        size: Size(size?? 80.0,size?? 80.0),
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
      var initials = 'AN';
      if (user == null) return initials;
      if (user.fullname.isEmpty) return initials;

      final u = user.fullname.split(' ');
      if (u.length == 1) return u.first;
      return '${u[0][0]}${u[1][0]}';
    } catch (e) {
      return 'AN';
    }
  }

  String initial([AuthUser? user]) {
    try {
      var initials = 'AN';
      if (user == null) return initials;
      if (user.fullname == null) return initials;

      final u = user.fullname?.split(' ');
      if (u?.length == 1) return u?.first??"";
      return ('${u?.first[0]}${u?.last[0]}').toUpperCase();
    } catch (e) {
      return 'AN';
    }
  }
}
