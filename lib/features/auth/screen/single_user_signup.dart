import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/loading_overlay.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/password_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization

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
    final localizations = AppLocalizations.of(context)!; // Access localization

    return LoadingOverlay(
      isLoading: authProviderState.normalButtonLoading ||
          authProviderState.googleButtonLoading,
      child: Scaffold(
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
                      localizations.signUp, // Localized text

                      style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      localizations.createAccount, // Localized text
                      style: const TextStyle(
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
                              height: 25.w,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2.w,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/googleIcon.png',
                                  fit: BoxFit.contain,
                                  width: 25.w,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  context.continueWithGoogle,
                                  style: CustomTextStyle.medium(
                                      fontSize: 16.sp,
                                      color: GlobalColors.dark2),
                                )
                              ],
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
                          localizations.orContinueWith,
                          style: CustomTextStyle.regular(
                            color: GlobalColors.darkOne,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(width: 105.w, child: const Divider()),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      label: localizations.firstName,
                      controller: SingleUserSignUpScreen.firstNameController,
                      hintText: localizations.enterFirstName,
                      focusedBorderColor: GlobalColors.orange,
                      validator: Validators.nameValidator,
                    ),
                    CustomTextField(
                      label: localizations.lastName,
                      controller: lastNameController,
                      hintText: localizations.enterLastName,
                      focusedBorderColor: GlobalColors.orange,
                      validator: Validators.nameValidator,
                    ),
                    CustomTextField(
                      label: localizations.email,
                      controller: SingleUserSignUpScreen.emailController,
                      hintText: localizations.enterEmail,
                      focusedBorderColor: GlobalColors.orange,
                      validator: Validators.emailValidator,
                    ),
                    PasswordTextField(
                      label: localizations.password,
                      controller: SingleUserSignUpScreen.passwordController,
                      hintText: localizations.createPassword,
                      obscureText: true,
                      focusedBorderColor: GlobalColors.orange,
                      validator: Validators.passwordValidator,
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
                      text: localizations.createAccountButton,
                      loading: authProviderState.normalButtonLoading,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          _handleCreateAccount(ref, context);
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
                          text: localizations.alreadyHaveAccount,
                          style: TextStyle(color: GlobalColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${localizations.login}",
                              style: TextStyle(
                                color: GlobalColors.orange,
                                fontWeight: FontWeight.bold,
                              ),
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
      ),
    );
  }

  void _handleCreateAccount(WidgetRef ref, BuildContext context) {
    ref.read(authProvider.notifier).registerSingleUser({
      'email': emailController.text.trim().toLowerCase(),
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'password': passwordController.text,
    }, context);
  }
}
