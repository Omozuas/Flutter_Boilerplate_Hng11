import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/validator.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';

import '../auth_api.dart';
import '../providers/auth.provider.dart';
import '../providers/show_social_button_provider.dart';

class RegularSignUpScreen extends ConsumerWidget {
  const RegularSignUpScreen({super.key});

  // Retrieve the TextEditingControllers
  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  static final firstNameFocusNode = FocusNode();
  static final lastNameFocusNode = FocusNode();
  static final emailFocusNode = FocusNode();
  static final passwordFocusNode = FocusNode();
  static final authApiProvider = Provider((ref) => AuthApi());
  static final isLoadingProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(signupFormProvider);
    final showSocialButtons = ref.watch(showSocialButtonsProvider);
    final socialButtonsController =
        ref.read(showSocialButtonsProvider.notifier);

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

    final authApi = ref.read(authApiProvider);
    final isLoading = ref.watch(isLoadingProvider);

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
                    StringManager.signUp,
                    style: TextStyle(
                      fontSize: 28.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    StringManager.createAnAccount,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  if (showSocialButtons)
                    // CustomButton(
                    //     onTap: () {},
                    //     borderColor: GlobalColors.borderColor,
                    //     text: 'Sign Up With Google',
                    //     height: 55.w,
                    //     containerColor: GlobalColors.white,
                    //     width: 50.w,
                    //     textColor: GlobalColors.iconColor),
                    //     Image.asset('assets/images/google.png',),
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
                          child: const Text(StringManager.or),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                  if (showSocialButtons) SizedBox(height: 10.h),
                  CustomTextField(
                    label: StringManager.firstName,
                    controller: firstNameController,
                    hintText: StringManager.enterFirstName,
                    borderColor: formState.firstNameError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                    focusNode: firstNameFocusNode,
                  ),
                  CustomTextField(
                    label: StringManager.lastName,
                    controller: lastNameController,
                    hintText: StringManager.enterLastName,
                    borderColor: formState.lastNameError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.nameValidator,
                    focusNode: lastNameFocusNode,
                  ),
                  CustomTextField(
                    label: StringManager.email,
                    controller: emailController,
                    hintText: StringManager.enterEmail,
                    borderColor: formState.emailError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.emailValidator,
                    focusNode: emailFocusNode,
                  ),
                  CustomTextField(
                    label: StringManager.password,
                    controller: passwordController,
                    hintText: StringManager.createPassword,
                    obscureText: true,
                    borderColor: formState.passwordError != null
                        ? Colors.red
                        : GlobalColors.borderColor,
                    focusedBorderColor: GlobalColors.orange,
                    validator: Validators.passwordValidator,
                    focusNode: passwordFocusNode,
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: StringManager.createAnAccount,
                    loading: isLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (formState.firstNameError == null &&
                            formState.lastNameError == null &&
                            formState.emailError == null &&
                            formState.passwordError == null) {
                          ref.read(isLoadingProvider.notifier).state = true;
                          try {
                            final response = await authApi.registerSingleUser(
                              email: emailController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              password: passwordController.text,
                            );

                            if (response != null) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(StringManager.registrationSuccessful)),
                                );
                              }
                              // Navigate to the next screen or perform any other action
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          StringManager.registrationFailed)),
                                );
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'An error occurred: ${e.toString()}')),
                              );
                            }
                          } finally {
                            ref.read(isLoadingProvider.notifier).state = false;
                          }
                        }
                      }
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
                        text: StringManager.alreadyHaveAnAccount,
                        style: TextStyle(color: GlobalColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: StringManager.alreadyHaveAnAccount,
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
