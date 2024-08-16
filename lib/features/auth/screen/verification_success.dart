import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_snackbar.dart';


class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Verification Successful',
                  style: CustomTextStyles.producHeaderBlack, // Updated style
                ),
                SizedBox(height: 16.h),
                Text(
                  'Your verification was successful, you can now proceed to reset your password.',
                  style: CustomTextStyles.productTextBodyBlack, // Updated style
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  onTap: () async {
                    // Show a snackbar when the button is tapped
                    showSnackBar("Redirecting to login...");

                    // Simulate a delay for the action
                    await Future.delayed(const Duration(seconds: 2));
                    if (context.mounted) {
                      context.pushReplacement(AppRoute.login);
                    }
                  },
                  borderColor: GlobalColors.borderColor,
                  text: "Continue to Login",
                  height: 48.h,
                  containerColor: GlobalColors.orange,
                  width: 342.w,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8.sp),
                  Expanded(
                    child: Text(
                      'Successfully Verified',
                      style: CustomTextStyles.bannerHeaderTextWhite, // Updated style
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
