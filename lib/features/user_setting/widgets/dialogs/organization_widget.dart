import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/switch_organization_dialog.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizationWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String domain;
  final bool isCurrentOrg;

  const OrganizationWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.domain,
    required this.isCurrentOrg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        children: [
          Container(
            height: 77.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: GlobalColors.blackColor),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              domain,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff999999)),
            )
          ]),
          const Spacer(),
          if (isCurrentOrg)
            SizedBox(
              height: 35.w,
              child: CustomButton(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const SwitchOrganizationDialog();
                      });
                },
                borderColor: GlobalColors.lightGray,
                text: context.switchButton,
                containerColor: GlobalColors.white,
                textColor: GlobalColors.darkTwo,
                fontsize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
