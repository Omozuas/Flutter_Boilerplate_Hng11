import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/loading_overlay.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/password_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/validator.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                AppLocalizations.of(context)!.signUp,
                      style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                     Text(AppLocalizations.of(context)!.createAccount,
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
                                  "Google",
                                  style: CustomTextStyle.medium(
                                      fontSize: 17.sp,
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
                          "or continue with",
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
                        _handleCreateAccount(ref, context);
                        if (formKey.currentState!.validate()) {
                          _handleCreateAccount(ref, context);
                          // ref.read(authProvider.notifier).registerSingleUser({
                          //   'email': emailController.text,
                          //   'first_name': firstNameController.text,
                          //   'last_name': lastNameController.text,
                          //   'password': passwordController.text,
                          // }, context);
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
                          text: 'Already Have An Account? ',
                          style: TextStyle(color: GlobalColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
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
      'email': emailController.text,
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'password': passwordController.text,
    }, context);
  }
}
