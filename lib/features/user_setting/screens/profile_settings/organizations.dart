import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/organization_widget.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Organization extends ConsumerStatefulWidget {
  const Organization({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrganizationState();
}

class _OrganizationState extends ConsumerState<Organization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: 'Manage Organizations',
        showDivider: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Keep Track of your organizations here.',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: GlobalColors.blackColor),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: const EdgeInsets.only(left: 90, right: 90),
                  child: Text(
                    'Click the toggle buttons to switch through organizations',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff999999)),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                const OrganizationWidget(
                    imageUrl:
                        'https://github.com/user-attachments/assets/984db31e-108f-4940-87e5-d6a494a2e1da',
                    name: 'Jumia',
                    domain: 'jumia.boilerplate.com',
                    isCurrentOrg: false),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            const OrganizationWidget(
                imageUrl:
                'https://github.com/user-attachments/assets/6b7a6f1c-cc8e-4d7b-9baf-febb9e41a103',
                name: 'Compad App',
                domain: 'compadapp.boilerplate.com',
                isCurrentOrg: true),
             SizedBox(height: 20.h,),
            const OrganizationWidget(
                imageUrl:
                'https://github.com/user-attachments/assets/a6b741e2-bacf-40c7-b02d-59ca042bdade',
                name: 'Slack',
                domain: 'slack.boilerplate.com',
                isCurrentOrg: true),
            SizedBox(height: 20.h,),
            const OrganizationWidget(
                imageUrl:
                'https://github.com/user-attachments/assets/6167ac5f-612e-4bc7-bdbd-45d72782db55',
                name: 'Facebook',
                domain: 'facebook.boilerplate.com',
                isCurrentOrg: true),
          ],
        ),
      ),
    );
  }
}
