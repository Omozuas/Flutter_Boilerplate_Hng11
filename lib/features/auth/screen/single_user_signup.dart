import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter_boilerplate_hng11/l10n/app_localizations.dart';

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
<<<<<<< HEAD
                      AppLocalizations.of(context)!.signUpTitle,
=======
                      localizations.signUp, // Localized text

>>>>>>> dev
                      style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
<<<<<<< HEAD
                      AppLocalizations.of(context)!.signUpSubtitle,
                      style: TextStyle(
=======
                      localizations.createAnAccount, // Localized text
                      style: const TextStyle(
>>>>>>> dev
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
<<<<<<< HEAD
                                  AppLocalizations.of(context)!.googleButton,
=======
                                  context.continueWithGoogle,
>>>>>>> dev
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
<<<<<<< HEAD
                          AppLocalizations.of(context)!.continueWithText,
=======
                          localizations.orContinueWith,
>>>>>>> dev
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
<<<<<<< HEAD
                      label: AppLocalizations.of(context)!.firstName,
                      controller: SingleUserSignUpScreen.firstNameController,
                      hintText: AppLocalizations.of(context)!.enterFirstName,
=======
                      label: localizations.firstName,
                      controller: SingleUserSignUpScreen.firstNameController,
                      hintText: localizations.enterFirstName,
>>>>>>> dev
                      focusedBorderColor: GlobalColors.orange,
                      validator: (v) => Validators.nameValidator(v, context),
                    ),
                    CustomTextField(
<<<<<<< HEAD
                      label: AppLocalizations.of(context)!.lastName,
                      controller: lastNameController,
                      hintText: AppLocalizations.of(context)!.enterLastName,
=======
                      label: localizations.lastName,
                      controller: lastNameController,
                      hintText: localizations.enterLastName,
>>>>>>> dev
                      focusedBorderColor: GlobalColors.orange,
                      validator: (v) => Validators.nameValidator(v, context),
                    ),
                    CustomTextField(
<<<<<<< HEAD
                      label: AppLocalizations.of(context)!.email,
                      controller: SingleUserSignUpScreen.emailController,
                      hintText: AppLocalizations.of(context)!.enterEmail,
=======
                      label: localizations.email,
                      controller: SingleUserSignUpScreen.emailController,
                      hintText: localizations.enterEmail,
>>>>>>> dev
                      focusedBorderColor: GlobalColors.orange,
                      validator: (v) => Validators.emailValidator(v, context),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                    ),
                    PasswordTextField(
<<<<<<< HEAD
                      label: AppLocalizations.of(context)!.password,
                      controller: SingleUserSignUpScreen.passwordController,
                      hintText: AppLocalizations.of(context)!.createPassword,
=======
                      label: localizations.password,
                      controller: SingleUserSignUpScreen.passwordController,
                      hintText: localizations.createPassword,
>>>>>>> dev
                      obscureText: true,
                      focusedBorderColor: GlobalColors.orange,
                      validator: (v) =>
                          Validators.passwordValidator(v, context),
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
<<<<<<< HEAD
                      text: AppLocalizations.of(context)!.createAccountButton,
=======
                      text: localizations.createAccountButton,
>>>>>>> dev
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
<<<<<<< HEAD
                          text: AppLocalizations.of(context)!.alreadyHaveAccount,
                          style: TextStyle(color: GlobalColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: AppLocalizations.of(context)!.login,
=======
                          text: localizations.alreadyHaveAccount,
                          style: TextStyle(color: GlobalColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${localizations.login}",
>>>>>>> dev
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
    ref.read(authProvider.notifier).registerSingleUser(
        {
          'email': emailController.text.trim().toLowerCase(),
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'password': passwordController.text,
        },
        context,
        [
          firstNameController,
          lastNameController,
          passwordController,
          emailController
        ]);
  }
}
