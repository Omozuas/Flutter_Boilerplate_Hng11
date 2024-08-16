import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/auth_api.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool loading = false;
  /// When you are ready to handle send, uncomment this function
  void _handleSend()async {


    }


  @override
  Widget build(BuildContext context) {
   // loading = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(
            Icons.chevron_left,
            size: 30.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8.sp),
            const Text(
              'Enter the email address you used to create the account to receive instructions on how to reset your password',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
            ),
            SizedBox(height: 28.sp),
            CustomTextField(
              label: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter your email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                if (value == _emailController.text) {
                  // Email validation regex
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }

                  return null;
                }
                return null;
              },
            ),
            SizedBox(height: 32.sp),
            CustomButton(
              loading: loading,
                onTap: () {
              _handleSend();
                },
                borderColor: GlobalColors.borderColor,
                text: "Send",
                height: 48.h,
                containerColor: GlobalColors.orange,
                width: 342.w,
                textColor: Colors.white),
            SizedBox(height: 16.sp),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Remember your password? ',
                  style: TextStyle(color: GlobalColors.darkOne),
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: GlobalColors.orange,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          context.push(AppRoute.login);
                         // :TODO add function to go login page
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
