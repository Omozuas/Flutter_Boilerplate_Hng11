import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import '../../../utils/global_colors.dart';
import 'package:go_router/go_router.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  // Future<void> _showLoadingIndicator(BuildContext context) async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return const AlertDialog(
  //         content: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CircularProgressIndicator(),
  //             SizedBox(width: 20),
  //             Text('Processing...'),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

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
                const SizedBox(height: 80), // Space for Snackbar
                Text(
                  'Verification Successful',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
                SizedBox(height: 16.sp),
                const Text(
                  'Your verification was successful, you can now proceed to reset your password.',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 24.sp),
                CustomButton(
                  onTap: () async {
                    // Show loading indicator
<<<<<<< HEAD
                    // await _showLoadingIndicator(context);
=======
                 //   await _showLoadingIndicator(context);
>>>>>>> e5306ef06daacf3f884bcd17690968add267b982

                    // Simulate network request
                  //  await Future.delayed(const Duration(seconds: 2));
                    if (context.mounted) {
                      // Hide loading indicator
                     // Navigator.of(context).pop(); // Close the loading dialog

                      // Proceed to login screen
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
                  const Expanded(
                    child: Text(
                      'Successfully Verified',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
