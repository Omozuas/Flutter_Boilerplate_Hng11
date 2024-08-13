import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState   extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  void _handleSend() {
    final email = _emailController.text;
    // Validate email format
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
      });
      return;
    }

    // Simulate email check
    if (email == 'test@example.com') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerificationScreen(email: email)),
      );
    } else {
      setState(() {
        _errorMessage = 'This email doesn\'t match our records, please try again';
      });
    }
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            const Text('Enter your email to reset your password.'),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: _errorMessage,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleSend,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
