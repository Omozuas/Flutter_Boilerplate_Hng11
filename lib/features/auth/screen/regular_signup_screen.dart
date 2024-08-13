import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/validator.dart';
import '../../../utils/widgets/custom_text_field.dart';

import '../providers/auth.provider.dart';
import '../providers/show_social_button_provider.dart';

class RegularSignUpScreen extends ConsumerWidget {
  const RegularSignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(signupFormProvider);
    final showSocialButtons = ref.watch(showSocialButtonsProvider);
    final socialButtonsController =
        ref.read(showSocialButtonsProvider.notifier);

    // Retrieve the TextEditingControllers
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    final firstNameFocusNode = FocusNode();
    final lastNameFocusNode = FocusNode();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    // Add listeners to hide social buttons when focusing on any TextField
    firstNameFocusNode.addListener(() {
      if (firstNameFocusNode.hasFocus) {
        socialButtonsController.hideSocialButtons();
      }
    });

    lastNameFocusNode.addListener(() {
      if (lastNameFocusNode.hasFocus) {
        socialButtonsController.hideSocialButtons();
      }
    });

    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        socialButtonsController.hideSocialButtons();
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        socialButtonsController.hideSocialButtons();
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        backgroundColor: GlobalColors.lightGray,
        title: Row(
          children: [
            const Icon(Icons.menu),
            const SizedBox(width: 8),
            Image(
              image: const AssetImage('assets/images/hng-boilerplate-Logo.png'),
              height: 40.h,
              width: 300.w,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
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
                  if (showSocialButtons)
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
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/google.png',
                        fit: BoxFit.contain,
                        width: 200.w,
                      ),
                    ),
                  if (showSocialButtons) SizedBox(height: 10.h),
                  if (showSocialButtons)
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
                  if (showSocialButtons) SizedBox(height: 10.h),
                  CustomTextField(
                    label: 'First Name',
                    controller: firstNameController,
                    hintText: 'Enter your first name',
                    borderColor: formState.firstNameError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                    focusNode: firstNameFocusNode,
                  ),
                  CustomTextField(
                    label: 'Last Name',
                    controller: lastNameController,
                    hintText: 'Enter your last name',
                    borderColor: formState.lastNameError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                    focusNode: lastNameFocusNode,
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    hintText: 'Enter your email',
                    borderColor: formState.emailError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.emailValidator,
                    focusNode: emailFocusNode,
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    hintText: 'Create your password',
                    obscureText: true,
                    borderColor: formState.passwordError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.passwordValidator,
                    focusNode: passwordFocusNode,
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      backgroundColor: GlobalColors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                       // formController.validate();
                      }
                    },
                    child: Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 16.w, color: GlobalColors.whiteColor),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already Have An Account? ',
                        style: TextStyle(color: GlobalColors.blackColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(color: GlobalColors.orange),
                            recognizer: TapGestureRecognizer()..onTap = () {},
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
