import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController =  TextEditingController();
  bool isCodeComplete = false;
  bool _isCodeValid = true;
  int _countdown = 420;
  late final Timer _timer;
  bool loading = false;

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
    final res = await ref
        .read(authProvider.notifier)
        .verifyCode(widget.email, codeController.text, context);
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
      appBar: const CustomAppBar.empty(),
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
                    localizations.verificationCodeTitle,  // Localized title
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      text:
                          '${localizations.verificationCodeDescription(widget.email)} ',
                      style: TextStyle(color: GlobalColors.darkOne),
                      children: [
                        TextSpan(
                          text: '$_countdown s',
                          style: TextStyle(
                            color: GlobalColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  PincodeField(controller: codeController),
                  SizedBox(height: 16.sp),
                  CustomButton(
                    loading: loading,
                    onTap: () async {
                      _handleVerify(ref, context);
                    },
                    borderColor: GlobalColors.borderColor,
                    text: localizations.verify, // Localized button text
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
                          text: localizations
                              .didntReceiveCodeText, // Localized text
                          style: TextStyle(color: GlobalColors.darkOne),
                          children: [
                            TextSpan(
                              text:
                                  localizations.resendOtpText, // Localized text
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
                          localizations.changeEmailText,  // Localized text
                          style:const TextStyle(
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

class PincodeField extends StatelessWidget {
  const PincodeField({super.key, required this.controller});
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeColor: GlobalColors.orange,
        inactiveColor: GlobalColors.lightGrey,
        selectedColor: GlobalColors.orange,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 40,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      controller: controller,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        debugPrint("Completed");
      },
      // onTap: () {
      //   print("Pressed");
      // },

      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}

