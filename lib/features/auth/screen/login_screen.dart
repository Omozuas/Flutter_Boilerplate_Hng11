import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/webview_page.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/validator.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/password_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../services/service_locator.dart';
import '../widgets/loading_overlay.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static GetStorage box = locator<GetStorage>();
  const LoginScreen({super.key});

  static final TextEditingController _emailController = TextEditingController();

  static final TextEditingController _passwordController =
      TextEditingController();

  static final _formKey = GlobalKey<FormState>();

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TapGestureRecognizer _tapGestureRecognizerForTermsAndConditions;
  late TapGestureRecognizer _tapGestureRecognizerForPrivacy;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizerForTermsAndConditions = TapGestureRecognizer()
      ..onTap = _handlePressForTandC;
    _tapGestureRecognizerForPrivacy = TapGestureRecognizer()
      ..onTap = _handlePressForPrivacy;
  }

  @override
  void dispose() {
    _tapGestureRecognizerForTermsAndConditions.dispose();
    _tapGestureRecognizerForPrivacy.dispose();
    super.dispose();
  }

  void _handlePressForTandC() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WebviewPage(
            url:
                'https://staging.nextjs.boilerplate.hng.tech/terms-and-conditions',
            appBarTitle: 'Terms and Conditions',
          ),
        ));
  }

  void _handlePressForPrivacy() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WebviewPage(
            url: 'https://staging.nextjs.boilerplate.hng.tech/privacy-policy',
            appBarTitle: 'Privacy Policy',
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // final isChecked = ref.watch(checkBoxState);
    final authStateProvider = ref.watch(authProvider);
    //  final loadingGoogle = ref.watch(loadingGoogleButton);

    return LoadingOverlay(
      isLoading: authStateProvider.normalButtonLoading ||
          authStateProvider.googleButtonLoading,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: LoginScreen._formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48.h,
                  ),
                  Text(
                    context.login,
                    style: CustomTextStyle.semiBold(
                      fontSize: 24.sp,
                      color: GlobalColors.iconColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.welcomeBackMessage,
                    style: CustomTextStyle.regular(
                      color: GlobalColors.darkOne,
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: authStateProvider.normalButtonLoading
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        side: const BorderSide(color: Colors.grey),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      onPressed: () {
                        ref.read(authProvider.notifier).googleSignin(context);
                      },
                      child: authStateProvider.googleButtonLoading
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
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 105.w, child: const Divider()),
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context)!.continueWithButton,
                        style: CustomTextStyle.regular(
                          color: GlobalColors.darkOne,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(width: 105.w, child: const Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  CustomTextField(
                    label: AppLocalizations.of(context)!.email,
                    controller: LoginScreen._emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    validator: (v) => Validators.emailValidator(v),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  PasswordTextField(
                    label: AppLocalizations.of(context)!.password,
                    controller: LoginScreen._passwordController,
                    hintText: AppLocalizations.of(context)!.password,
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
                              ref.read(authProvider.notifier).setCheckBoxState =
                                  !authStateProvider.checkBoxState;
                            },
                            child: Icon(
                              authStateProvider.checkBoxState
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: authStateProvider.checkBoxState
                                  ? GlobalColors.orange
                                  : GlobalColors.darkOne,
                            ),
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        AppLocalizations.of(context)!.rememberMeCheckbox,
                        style: CustomTextStyle.medium(
                          color: GlobalColors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.push(AppRoute.forgotPassword);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgotPasswordLink,
                          style: CustomTextStyle.regular(
                            color: GlobalColors.orange,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomButton(
                      loading: authStateProvider.normalButtonLoading,
                      onTap: () async {
                        if (LoginScreen._formKey.currentState?.validate() ??
                            false) {
                          LoginScreen.box.write(
                              'rememberMe', authStateProvider.checkBoxState);
                          _handleLoginAccount(ref, context);
                        }
                      },
                      borderColor: GlobalColors.borderColor,
                      text: AppLocalizations.of(context)!.login,
                      height: 48.h,
                      fontWeight: FontWeight.bold,
                      containerColor: authStateProvider.googleButtonLoading
                          ? Colors.grey.withOpacity(0.2)
                          : GlobalColors.orange,
                      width: 342.w,
                      textColor: Colors.white),
                  SizedBox(
                    height: 8.h,
                  ),
                  // CustomButton(
                  //     onTap: () {},
                  //     borderColor: GlobalColors.borderColor,
                  //     text: "Use Magic Link instead",
                  //     height: 48.h,
                  //     containerColor: Colors.white,
                  //     width: 342.w,
                  //     textColor: GlobalColors.darkOne),
                  const SizedBox(
                    height: 23.5,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: TextStyle(color: GlobalColors.darkOne),
                        children: [
                          TextSpan(
                              text: ' ${AppLocalizations.of(context)!.signUp}',
                              style: TextStyle(
                                  color: GlobalColors.orange,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go(AppRoute.singleUserSignUp);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const SingleUserSignUpScreen()),
                                  // );
                                }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 49.h,
                  ),
                  SizedBox(
                    width: 342.w,
                    // height: 35.h,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppLocalizations.of(context)!
                            .termsAndConditionText1,
                        style: CustomTextStyle.regular(
                          color: GlobalColors.bgsurface700,
                          fontSize: 14.sp,
                        ),
                        // GoogleFonts.inter(
                        //   color: GlobalColors.bgsurface700,
                        //   fontSize: 14.sp,
                        //   fontWeight: FontWeight.w400,

                        children: [
                          TextSpan(
                            recognizer:
                                _tapGestureRecognizerForTermsAndConditions,
                            text: AppLocalizations.of(context)!
                                .termsAndConditionText2,
                            style: CustomTextStyle.regular(
                              fontSize: 14.sp,
                              color: GlobalColors.orange,
                            ),
                          ),
                          TextSpan(
                              text: AppLocalizations.of(context)!
                                  .termsAndConditionText3),
                          TextSpan(
                            recognizer: _tapGestureRecognizerForPrivacy,
                            text: AppLocalizations.of(context)!
                                .termsAndConditionText4,
                            style: CustomTextStyle.regular(
                              fontSize: 14.sp,
                              color: GlobalColors.orange,
                            ),
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
      )),
    );
  }

  void _handleLoginAccount(WidgetRef ref, BuildContext context) {
    ref.read(authProvider.notifier).login({
      'email': LoginScreen._emailController.text,
      'password': LoginScreen._passwordController.text,
    }, context);
  }
}

//SafeArea(
//         child: Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 48.h,
//                 ),
//                 Text(
//                   "Login",
//                   style: GoogleFonts.inter(
//                       color: const Color(0xFF141414),
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 Text(
//                   "Welcome back, please enter your details",
//                   style: GoogleFonts.inter(
//                       color: GlobalColors.darkOne,
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 28.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     //:TODO add google sign up feature
//                   },
//                   child: Container(
//                     height: 52.h,
//                     width: 342.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.r),
//                       border: Border.all(color: GlobalColors.borderColor),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // kindly uncomment the code below when the login screen has been changed to a consumer stateless widget
//                             //  ref.read(authProvider.notifier).googleSignin(context);
//                           },
//                           child: SizedBox(
//                               height: 24.h,
//                               width: 24.w,
//                               child:
//                                   Image.asset("assets/images/googleIcon.png")),
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         Text(
//                           "Google",
//                           style: GoogleFonts.inter(
//                               fontSize: 16.sp, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(width: 105.w, child: const Divider()),
//                     const Spacer(),
//                     Text(
//                       "or continue with",
//                       style: GoogleFonts.inter(
//                           color: GlobalColors.darkOne,
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     const Spacer(),
//                     SizedBox(width: 105.w, child: const Divider()),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 28.h,
//                 ),
//                 CustomTextField(
//                   label: "Email",
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   hintText: "Enter your email",
//                   validator:(v)=> Validators.emailValidator(v),
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 CustomTextField(
//                   label: "Password",
//                   obscureText: true,
//                   controller: _passwordController,
//                   hintText: "Enter your password",
//                   suffixIcon: const Icon(Icons.visibility_off),
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                         padding: EdgeInsets.zero,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isChecked = !isChecked;
//                             });
//                           },
//                           child: Icon(
//                             isChecked
//                                 ? Icons.check_box
//                                 : Icons.check_box_outline_blank,
//                             color: isChecked
//                                 ? GlobalColors.orange
//                                 : GlobalColors.darkOne,
//                           ),
//                         )),
//                     SizedBox(
//                       width: 8.w,
//                     ),
//                     Text(
//                       "Remember Me",
//                       style: GoogleFonts.inter(
//                           color: const Color(0XFF0A0A0A),
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   const ForgotPasswordScreen()),
//                         );
//                         //:TODO add function for forgot password
//                       },
//                       child: Text(
//                         "Forgot Password?",
//                         style: GoogleFonts.inter(
//                             color: GlobalColors.orange,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 32.h,
//                 ),
//                 CustomButton(
//                     onTap: () async {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         setState(() {
//                           isLoading = false;
//                         });
//                         try {
//                           final response = await authApi.loginUser(
//                               {
//                             'email': _emailController.text,
//                             'password': _passwordController.text
//                           });
//                           if (response != null) {
//                             //Navigate to the next screen
//                           }
//                         } catch (e) {
//                           debugPrint(
//                               'Error occured during login: ${e.toString()}');
//                         } finally {
//                           setState(() {
//                             isLoading = false;
//                           });
//                         }
//                       }
//
//                       //:TODO
//                       // add logic for login
//                     },
//                     borderColor: GlobalColors.borderColor,
//                     text: "Login",
//                     height: 48.h,
//                     containerColor: GlobalColors.orange,
//                     width: 342.w,
//                     textColor: Colors.white),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 CustomButton(
//                     onTap: () {},
//                     borderColor: GlobalColors.borderColor,
//                     text: "Use Magic Link instead",
//                     height: 48.h,
//                     containerColor: Colors.white,
//                     width: 342.w,
//                     textColor: GlobalColors.darkOne),
//                 const SizedBox(
//                   height: 23.5,
//                 ),
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       text: 'Don\'t have an account? ',
//                       style: TextStyle(color: GlobalColors.darkOne),
//                       children: [
//                         TextSpan(
//                             text: 'Sign Up',
//                             style: TextStyle(
//                                 color: GlobalColors.orange,
//                                 fontWeight: FontWeight.bold),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           CompanySignUpScreen()),
//                                 );
//                               }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 49.h,
//                 ),
//                 SizedBox(
//                   width: 342.w,
//                   height: 48.h,
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: 'By logging in, you agree with our ',
//                       style: GoogleFonts.inter(
//                           color: GlobalColors.bgsurface700,
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w400),
//                       children: [
//                         TextSpan(
//                           text: 'Terms & \nUse ',
//                           style: GoogleFonts.inter(
//                               fontSize: 14.sp,
//                               color: GlobalColors.orange,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         TextSpan(
//                           text: 'and ',
//                           style: GoogleFonts.inter(
//                             color: GlobalColors.black,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'Privacy Policy.',
//                           style: GoogleFonts.inter(
//                               fontSize: 14.sp,
//                               color: GlobalColors.orange,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
