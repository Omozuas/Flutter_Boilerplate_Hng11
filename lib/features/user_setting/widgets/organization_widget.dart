import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizationWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String domain;
  final bool isCurrentOrg;

  const OrganizationWidget({
    super.key, required this.imageUrl, required this.name, required this.domain, required this.isCurrentOrg
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 77.h,
          width: 84.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(domain)
            ]
        ),
        Visibility(
          visible: isCurrentOrg == false ? true : false,
          child: CustomButton(
            onTap: () {},
            borderColor: GlobalColors.borderColor,
            text: 'Switch',
            height: 53.0,
            containerColor: GlobalColors.white,
            width: double.infinity,
            textColor: GlobalColors.black,

          ),
        )
      ],);
  }
}