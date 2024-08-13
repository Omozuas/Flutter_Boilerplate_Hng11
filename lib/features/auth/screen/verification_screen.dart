import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // Simulate code validation
    if (code == '123456') {
      // Simulate successful verification
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const VerificationSuccessScreen()),
      );
    } else {
      setState(() {
        _isCodeValid = false;
        // Show resend code and change email prompts
      });
    }
  }

  void _handleResend() {
    // Handle code resend logic
    setState(() {
      _countdown = 60;
      _startTimer();
      _isCodeValid = true; // Reset code validity
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          'Input the code from your email: ${widget.email}'),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Time remaining: $_countdown s',
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
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
                                (controller) => controller.text.isNotEmpty);
                          });
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isCodeComplete ? _handleVerify : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor:
                        _isCodeComplete ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Verify'),
                ),
                if (!_isCodeValid || _countdown == 0) ...[
                  const SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: _handleResend,
                            child: const Text('Resend Code'),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Text('or'),
                      Column(
                        children: [
                          TextButton(
                            onPressed: _handleChangeEmail,
                            child: const Text('Change Email',
                                style: TextStyle(
                                    color: Colors.orange,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ],
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.white),
                    const SizedBox(width: 8),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80), // Add space for Snackbar
                Text(
                  'Verification Successful',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your verification was successful, you can now proceed to reset your password',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 24),
                CustomButton(
                    onTap: () async {
                      // Show loading indicator
                      await _showLoadingIndicator(context);

                      // Simulate network request
                      await Future.delayed(const Duration(seconds: 2));

                      // Hide loading indicator
                      Navigator.of(context).pop(); // Close the loading dialog

                      // Proceed to reset password screen or other actions
                    },
                    borderColor: GlobalColors.borderColor,
                    text: "Continue to Login",
                    height: 48.h,
                    containerColor: GlobalColors.orange,
                    width: 342.w,
                    textColor: Colors.white),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Successfully Verified',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
