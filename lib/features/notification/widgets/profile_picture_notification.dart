import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';

class NotificationProfilePicture extends StatelessWidget {
  final String? image;
  const NotificationProfilePicture({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 42.w,
      padding: 1.sp.padA,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2.r,
              color: Colors.black
          )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
            decoration: BoxDecoration(
                image: image == null? null :  DecorationImage(
                    image: CachedNetworkImageProvider(
                        image??""
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(image == null) Image.asset(
                  AppImages.system,
                  height: 24.h,
                  width: 24.w,
                )
              ],
            )
        ),
      ),
    );
  }
}