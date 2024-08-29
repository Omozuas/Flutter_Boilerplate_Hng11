import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Organization extends ConsumerStatefulWidget {
  const Organization({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrganizationState();
}

class _OrganizationState extends ConsumerState<Organization> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        //TODO:CHANGE TO CORRECT STRING
        titleText:  AppLocalizations.of(context)!.members,
        showDivider: false,
      ),
      body: SafeArea(
        child: Column(
            children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            //TODO: CHANGE TO CORRECT STRING
            Text('Keep Track of your organizations here.'),
            SizedBox(height: 5.h),
            Text('Click the toggle buttons to switch through organizations',
              //  style: CustomTextStyle.regular(fontSize: 14.sp, ),
            ),
            SizedBox(height: 40.h,),
            // OrganizationWidget(),
            SizedBox(height: 20.h)
          ],
        ),
      ),
      const Divider(),
      SizedBox(height: 20.h,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        // child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        //   return
        // },
        )
    ),

      ),
    ),
    );
  }
}

