import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/validator.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {}

  void _handleResetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed with the password reset process
      context.push(AppRoute.login);
    }
  }

  void _handleResend() {
    setState(() {
      _startTimer();
    });
  }

  void _handleChangeEmail() {
    context.go(AppRoute.forgotPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 30.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Reset Password',
                style: CustomTextStyles.headerTextBlack, // Updated style
              ),
              SizedBox(height: 8.sp),
              Text(
                'Create a unique password. Your password should be easy to remember.',
                style: CustomTextStyles.productTextBodyBlack, // Updated style
              ),
              SizedBox(height: 28.sp),
              CustomTextField(
                label: "New Password",
                controller: _newPasswordController,
                obscureText: true,
                hintText: "Enter new password",
                validator: Validators.passwordValidator,
              ),
              SizedBox(height: 16.sp),
              CustomTextField(
                label: "Confirm Password",
                controller: _confirmPasswordController,
                obscureText: true,
                hintText: "Confirm new password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.sp),
              CustomButton(
                onTap: _handleResetPassword,
                borderColor: GlobalColors.borderColor,
                text: "Continue",
                height: 48.h,
                containerColor: GlobalColors.orange,
                width: 342.w,
                textColor: Colors.white,
              ),
              SizedBox(height: 16.sp),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Remember your password? ',
                    style: CustomTextStyles.productTextBodyBlack, // Updated style
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: CustomTextStyles.bannerbodyTextOrange, // Updated style
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacement(AppRoute.login);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    '__________  Or  __________',
                    style: CustomTextStyles.productTextBodyBlack, // Updated style
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: TextButton(
                  onPressed: _handleChangeEmail,
                  child: Text(
                    'Change Email',
                    style: CustomTextStyles.bannerbodyTextOrange, // Updated style
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
