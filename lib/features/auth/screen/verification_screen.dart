import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import 'login_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
  bool _isCodeComplete = false;
  bool _isCodeValid = true;
  int _countdown = 60;
  late final Timer _timer;

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

  void _handleVerify() {
    final code = _codeControllers.map((c) => c.text).join();
    if (code == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerificationSuccessScreen(),
        ),
      );
    } else {
      setState(() {
        _isCodeValid = false;
      });
    }
  }

  void _handleResend() {
    setState(() {
      _countdown = 60;
      _startTimer();
      _isCodeValid = true;
    });
  }

  void _handleChangeEmail() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
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
                    text: 'Confirm the email sent to ${widget.email} and enter the verification code. Code expires in ',
                    style: TextStyle(color: GlobalColors.darkOne),
                    children: [
                      TextSpan(
                        text: '00:$_countdown s',
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
                      child: TextField(
                        controller: _codeControllers[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
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
                            _isCodeComplete = _codeControllers.every(
                              (controller) => controller.text.isNotEmpty,
                            );
                          });
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16.sp),
                ElevatedButton(
                  onPressed: _isCodeComplete ? _handleVerify : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: _isCodeComplete ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Verify', style: TextStyle(color: Colors.white,),
                ),),
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
                              ..onTap = _handleResend,
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
          if (!_isCodeValid)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 8.sp),
                    const Expanded(
                      child: Text(
                        'Invalid code, please try again.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isCodeValid = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  Future<void> _showLoadingIndicator(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Processing...'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80), // Space for Snackbar
                Text(
                  'Verification Successful',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
                SizedBox(height: 16.sp),
                const Text(
                  'Your verification was successful, you can now proceed to reset your password.',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 24.sp),
                CustomButton(
                  onTap: () async {
                    // Show loading indicator
                    await _showLoadingIndicator(context);

                    // Simulate network request
                    await Future.delayed(const Duration(seconds: 2));

                    // Hide loading indicator
                    Navigator.of(context).pop(); // Close the loading dialog

                    // Proceed to reset password screen or other actions
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  borderColor: GlobalColors.borderColor,
                  text: "Continue to Login",
                  height: 48.h,
                  containerColor: GlobalColors.orange,
                  width: 342.w,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8.sp),
                  const Expanded(
                    child: Text(
                      'Successfully Verified',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}