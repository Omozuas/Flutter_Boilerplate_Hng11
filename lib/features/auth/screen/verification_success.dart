import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
=======
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization
>>>>>>> dev

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80.h),
                Text(
<<<<<<< HEAD
                  AppLocalizations.of(context)!.verificationSuccessful,  
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(height: 16.sp),
                Text(
                  AppLocalizations.of(context)!.verificationMessage,  
=======
                  localizations.verificationSuccess,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
                SizedBox(height: 16.sp),
                Text(
                  localizations.verificationSuccessDescription,
>>>>>>> dev
                  style: const TextStyle(fontSize: 13),
                ),
                SizedBox(height: 24.sp),
                CustomButton(
                  onTap: () async {
                    BuildContext c = context;

                    if (c.mounted) {
                      c.go(AppRoute.login);
                    }
                  },
                  borderColor: GlobalColors.borderColor,
<<<<<<< HEAD
                  text: AppLocalizations.of(context)!.continueToLogin,  
=======
                  text: localizations.continueToLogin, // Localized button text
>>>>>>> dev
                  height: 48.h,
                  containerColor: GlobalColors.orange,
                  width: 342.w,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
