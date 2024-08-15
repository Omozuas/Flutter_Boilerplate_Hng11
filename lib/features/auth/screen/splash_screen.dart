import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/single_user_signup.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';

import '../../../services/service_locator.dart';
import '../../../utils/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static GetStorage box = locator<GetStorage>();
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1),(){
      if( box.read('accessToken') == null){
        context.go(AppRoute.singleUserSignUp);
      }
      else{
        context.go(AppRoute.login);
        /// TODO: Implement a logic to get user details with saved token
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 211.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'HNG Boilerplate',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: GlobalColors.darkOne,
            ),
          ),
          // SizedBox(
          //   height: 60.h,
          // ),
          // CustomButton(
          //   text: 'Sign Up',
          //   onTap: () {
          //     OneContext().showModalBottomSheet(
          //         builder: (ct) => SizedBox(
          //               width: double.infinity,
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   TextButton(
          //                       onPressed: () {
          //                         Navigator.pop(ct);
          //                         Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: (context) =>
          //                                     CompanySignUpScreen()));
          //                       },
          //                       child: Text(
          //                         'As a company',
          //                         style: TextStyle(
          //                             fontSize: 16.sp,
          //                             fontWeight: FontWeight.bold),
          //                       )),
          //                   TextButton(
          //                       onPressed: () {
          //                         Navigator.pop(ct);
          //                         Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: (context) =>
          //                                     const SingleUserSignUpScreen()));
          //                       },
          //                       child: Text(
          //                         'As a single user',
          //                         style: TextStyle(
          //                             fontSize: 16.sp,
          //                             fontWeight: FontWeight.bold),
          //                       )),
          //                 ],
          //               ),
          //             ));
          //   },
          //   textColor: GlobalColors.white,
          //   borderColor: GlobalColors.orange,
          //   height: 40.h,
          //   containerColor: GlobalColors.orange,
          //   width: 250,
          // ),
          // SizedBox(
          //   height: 20.h,
          // ),
          // CustomButton(
          //   text: 'Login',
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const LoginScreen()));
          //   },
          //   textColor: GlobalColors.white,
          //   borderColor: GlobalColors.orange,
          //   height: 40.h,
          //   containerColor: GlobalColors.orange,
          //   width: 250,
          // ),
        ],
      ),
    );
  }
}
