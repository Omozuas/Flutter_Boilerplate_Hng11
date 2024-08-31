import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/switch_organization_dialog.dart';
import 'package:flutter_boilerplate_hng11/utils/app_images.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/shimmer_loaders.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizationWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final String domain;
  final bool isCurrentOrg;

  const OrganizationWidget({
    super.key,
    required this.name,
    required this.domain,
    required this.isCurrentOrg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
      child: Row(
        children: [
          Container(
            height: 77.h,
            width: 80.w,
            padding: 10.sp.padA,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1.w, color: GlobalColors.orange)
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: AssetImage(AppImages.system),
                    fit: BoxFit.cover
                ),
              ),
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
          if (!isCurrentOrg)
            SizedBox(
              height: 35.w,
              child: CustomButton(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                onTap: (){
                  if(onTap!=null){
                    onTap!();
                  }
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

class OrganizationLoadingWidget extends StatelessWidget {

  const OrganizationLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 77.h,
            width: 80.w,
            padding: 10.sp.padA,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1.w, color: GlobalColors.orange)
            ),
            child: const ShimmerCard(),
          ),
          SizedBox(
            width: 13.w,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            small(height: 16.h, width: 50.w),
            SizedBox(
              height: 3.h,
            ),
            small(height: 16.h, width: 150.w),
          ]),
          16.0.sbW,
          small(height: 55.h, width: 38.w),
        ],
      ),
    );
  }

  small({double? height, double? width, EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding,
      height: height ?? 15.h,
      width: width ?? 50.w,
      child: const ShimmerCard(),
    );
  }
}
