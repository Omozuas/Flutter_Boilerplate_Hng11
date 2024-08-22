import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

  _restartTimer() {
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
    debugPrint(code.runtimeType.toString());
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
    // if (code == '123456') {
    //   context.push(AppRoute.verificationSuccess);
    // } else {
    //   setState(() {
    //     _isCodeValid = false;
    //   });
    // }
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
    return Scaffold(
      appBar: AppBar(
        leading: const ChevronBackButton(),
      ),
      body: Consumer(builder: (context, ref, child) {
        // loading = false;
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Verification Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      text:
                          'Confirm the email sent to ${widget.email} and enter the verification code. Code expires in ',
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
                                  color:
                                      _isCodeValid ? Colors.orange : Colors.red,
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
                    text: "Continue",
                    height: 48.h,
                    containerColor: GlobalColors.orange,
                    width: 342.w,
                    textColor: Colors.white,
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     _handleVerify(ref, context);
                  //   },
                  //   // _isCodeComplete ? _handleVerify : null,
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     backgroundColor:
                  //         _isCodeComplete ? Colors.orange : Colors.grey,
                  //   ),
                  //   child: const Text(
                  //     'Verify',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  if (!_isCodeValid || _countdown == 0) ...[
                    SizedBox(height: 16.sp),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Didn\'t receive any code? ',
                          style: TextStyle(color: GlobalColors.darkOne),
                          children: [
                            TextSpan(
                              text: 'Resend OTP',
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
                        child: const Text(
                          'Change Email',
                          style: TextStyle(
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
            // if (!_isCodeValid)
            //   Positioned(
            //     top: 0,
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //       color: Colors.red,
            //       padding:
            //           EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.error, color: Colors.white),
            //           SizedBox(width: 8.sp),
            //           const Expanded(
            //             child: Text(
            //               'Invalid code, please try again.',
            //               style: TextStyle(color: Colors.white, fontSize: 16),
            //             ),
            //           ),
            //           IconButton(
            //             icon: const Icon(Icons.close, color: Colors.white),
            //             onPressed: () {
            //               setState(() {
            //                 _isCodeValid = true;
            //               });
            //             },
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        );
      }),
    );
  }
}
