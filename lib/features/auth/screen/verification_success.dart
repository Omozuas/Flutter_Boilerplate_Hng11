import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import '../../../utils/global_colors.dart';
import 'package:go_router/go_router.dart';

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
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
                SizedBox(height: 16.sp),
                const Text(
                  'Your verification was successful, you can now proceed to login',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 24.sp),
                CustomButton(
                  onTap: () async {
                    BuildContext c = context;

                    if (c.mounted) {
                      c.go(AppRoute.login);
                      // AppRouter.router.p
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
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     color: Colors.green,
          //     padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
          //     child: Row(
          //       children: [
          //         const Icon(Icons.check_circle, color: Colors.white),
          //         SizedBox(width: 8.sp),
          //         const Expanded(
          //           child: Text(
          //             'Successfully Verified',
          //             style: TextStyle(color: Colors.white, fontSize: 16),
          //           ),
          //         ),
          //         IconButton(
          //           icon: const Icon(Icons.close, color: Colors.white),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
