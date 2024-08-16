import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/password_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/validator.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';

import '../providers/auth.provider.dart';

class SingleUserSignUpScreen extends ConsumerWidget {
  const SingleUserSignUpScreen({super.key});

  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviderState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 76.h),
          child: FocusScope(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 28.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    'Create an account to get started with us.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: const BorderSide(color: Colors.grey),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    onPressed: () {
                      ref.read(authProvider.notifier).googleSignin(context);
                    },
                    child: authProviderState.googleButtonLoading
                        ? SizedBox(
                            width: 16.w,
                            height: 16.w,
                            child: CircularProgressIndicator.adaptive(
                              strokeWidth: 2.w,
                            ),
                          )
                        : Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.contain,
                            width: 200.w,
                          ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: <Widget>[
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Text('Or'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    label: 'First Name',
                    controller: SingleUserSignUpScreen.firstNameController,
                    hintText: 'Enter your first name',
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                  ),
                  CustomTextField(
                    label: 'Last Name',
                    controller: lastNameController,
                    hintText: 'Enter your last name',
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: SingleUserSignUpScreen.emailController,
                    hintText: 'Enter your email',
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.emailValidator,
                  ),
                  PasswordTextField(
                    label: 'Password',
                    controller: SingleUserSignUpScreen.passwordController,
                    hintText: 'Create your password',
                    obscureText: true,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.passwordValidator,
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: 'Create Account',
                    loading: authProviderState.normalButtonLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          },
                        );
                        ref.read(authProvider.notifier).registerSingleUser({
                          'email': emailController.text,
                          'first_name': firstNameController.text,
                          'last_name': lastNameController.text,
                          'password': passwordController.text,
                        }, context);
                        Navigator.of(context).pop();
                      }
                      Navigator.of(context).pop();
                    },
                    textColor: GlobalColors.white,
                    borderColor: GlobalColors.orange,
                    height: 55.h,
                    containerColor: GlobalColors.orange,
                    width: 50,
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already Have An Account? ',
                        style: TextStyle(color: GlobalColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(color: GlobalColors.orange),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(AppRoute.login);
                              },
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
      ),
    );
  }
}
