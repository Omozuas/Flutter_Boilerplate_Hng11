import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 
=======
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization
>>>>>>> dev

import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
  bool isCodeComplete = false;
  bool _isCodeValid = true;
  int _countdown = 420;
  late final Timer _timer;
  bool loading = false;
<<<<<<< HEAD
  
=======

>>>>>>> dev
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _restartTimer() {
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _handleVerify(WidgetRef ref, BuildContext context) async {
    setState(() {
      loading = true;
    });
    final code = _codeControllers.map((c) => c.text).join();
    final res = await ref
        .read(authProvider.notifier)
        .verifyCode(widget.email, code, context);
    if (res != null && !res) {
      _isCodeValid = false;
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  bool codeResent = false;
  void _handleResend(WidgetRef ref) async {
    await ref.read(authProvider.notifier).forgotPassword(widget.email, context);
    codeResent = true;
    setState(() {
      _countdown = 420;
      _restartTimer();
      _isCodeValid = true;
    });
  }

  void _handleChangeEmail() {
    _timer.cancel();
    context.pop();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!; // Access localization

    return Scaffold(
      // appBar: AppBar(
      //   leading: const ChevronBackButton(),
      //   title: Text(localizations.verificationAppBarTitle),  // Localized AppBar title
      // ),
      body: Consumer(builder: (context, ref, child) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
<<<<<<< HEAD
                    AppLocalizations.of(context)!.verificationCode,  
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
=======
                    localizations.verificationCodeTitle,  // Localized title
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
>>>>>>> dev
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
<<<<<<< HEAD
                      text: '${AppLocalizations.of(context)!.confirmEmail} ${widget.email} ${AppLocalizations.of(context)!.enterVerificationCode} ',  
=======
                      text:
                          '${localizations.verificationCodeDescription(widget.email)} ${_countdown.toString()} ',
>>>>>>> dev
                      style: TextStyle(color: GlobalColors.darkOne),
                      children: [
                        TextSpan(
                          text: '$_countdown ${AppLocalizations.of(context)!.seconds}',  
                          style: TextStyle(
                            color: GlobalColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: TextField(
                            controller: _codeControllers[index],
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isCodeValid ? Colors.orange : Colors.red,
                                ),
                              ),
                              counterText: '',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                              setState(() {
                                isCodeComplete = _codeControllers.every(
                                  (controller) => controller.text.isNotEmpty,
                                );
                              });
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.sp),
                  CustomButton(
                    loading: loading,
                    onTap: () async {
                      _handleVerify(ref, context);
                    },
                    borderColor: GlobalColors.borderColor,
<<<<<<< HEAD
                    text: AppLocalizations.of(context)!.continueText,  
=======
                    text: localizations.verify, // Localized button text
>>>>>>> dev
                    height: 48.h,
                    containerColor: GlobalColors.orange,
                    width: 342.w,
                    textColor: Colors.white,
                  ),
                  if (!_isCodeValid || _countdown == 0) ...[
                    SizedBox(height: 16.sp),
                    Center(
                      child: RichText(
                        text: TextSpan(
<<<<<<< HEAD
                          text: AppLocalizations.of(context)!.didNotReceiveCode,  
                          style: TextStyle(color: GlobalColors.darkOne),
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.resendOtp,  
=======
                          text: localizations
                              .didntReceiveCodeText, // Localized text
                          style: TextStyle(color: GlobalColors.darkOne),
                          children: [
                            TextSpan(
                              text:
                                  localizations.resendOtpText, // Localized text
>>>>>>> dev
                              style: TextStyle(
                                color: GlobalColors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => _handleResend(ref),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.sp),
                    Center(
                      child: TextButton(
                        onPressed: _handleChangeEmail,
                        child: Text(
<<<<<<< HEAD
                          AppLocalizations.of(context)!.changeEmail,  
                          style: const TextStyle(
=======
                          localizations.changeEmailText,  // Localized text
                          style:const TextStyle(
>>>>>>> dev
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
