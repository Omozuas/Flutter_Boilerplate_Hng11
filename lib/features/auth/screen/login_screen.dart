import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value, TextEditingController emailController) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value == emailController.text) {
      // Email validation regex
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null; // Valid email
    }
    return null; // Valid input but doesn't match emailController.text
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.inter(
                      color: const Color(0xFF141414),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Welcome back, please enter your details",
                  style: GoogleFonts.inter(
                      color: GlobalColors.darkOne,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 28.h,
                ),
                GestureDetector(
                  onTap: () {
                    //:TODO add google sign up feature
                  },
                  child: Container(
                    height: 52.h,
                    width: 342.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: GlobalColors.borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: Image.asset("assets/images/googleIcon.png")),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Google",
                          style: GoogleFonts.inter(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 105.w, child: const Divider()),
                    const Spacer(),
                    Text(
                      "or continue with",
                      style: GoogleFonts.inter(
                          color: GlobalColors.darkOne,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    SizedBox(width: 105.w, child: const Divider()),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
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
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  label: "Password",
                  obscureText: true,
                  controller: _passwordController,
                  hintText: "Enter your password",
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.zero,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Icon(
                            isChecked
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: isChecked
                                ? GlobalColors.orange
                                : GlobalColors.darkOne,
                          ),
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Remember Me",
                      style: GoogleFonts.inter(
                          color: Color(0XFF0A0A0A),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        //:TODO add function for forgot password
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.inter(
                            color: GlobalColors.orange,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Custombutton(
                    onTap: () {
                      _formKey.currentState?.validate();

                      //:TODO
                      // add logic for login
                    },
                    borderColor: GlobalColors.borderColor,
                    text: "Login",
                    height: 48.h,
                    containerColor: GlobalColors.orange,
                    width: 342.w,
                    textColor: Colors.white),
                SizedBox(
                  height: 8.h,
                ),
                Custombutton(
                    onTap: () {},
                    borderColor: GlobalColors.borderColor,
                    text: "Use Magic Link instead",
                    height: 48.h,
                    containerColor: Colors.white,
                    width: 342.w,
                    textColor: GlobalColors.darkOne),
                const SizedBox(
                  height: 23.5,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: GlobalColors.darkOne),
                      children: [
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: GlobalColors.orange,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // :TODO add function to go sign up page
                              }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 49.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'By logging in, you agree with our ',
                      style: TextStyle(color: GlobalColors.darkOne),
                      children: [
                        TextSpan(
                          text: 'Terms & \nUse ',
                          style: TextStyle(
                              color: GlobalColors.orange,
                              fontWeight: FontWeight.w400),
                        ),
                        const TextSpan(
                          text: 'and ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                              color: GlobalColors.orange,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
