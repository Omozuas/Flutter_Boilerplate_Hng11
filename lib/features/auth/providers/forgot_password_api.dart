import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:http/http.dart' as http;

class ForgotPassowrdProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

// to sent otp code to the email
  Future<void> forgotPassword(BuildContext context, String email) async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api-golang.boilerplate.hng.tech/api/v1/auth/password-reset');
    try {
      final response = await http.post(url,
          headers: {'content-Type': 'application/json'},
          body: json.encode({'email': email}));

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: GlobalColors.orange,
            content: const Text(
              'Password reset link sent successfully ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )));
        _loading = false;
        notifyListeners();
      } else {
        //handle error
      }
    } catch (e) {
      //handle connection error
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: GlobalColors.orange,
          content: Text(
            e.toString(),
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )));
      _loading = false;
      notifyListeners();
    }
  }

  // to verify the otp code and change the password
  Future<void> resetPassword(
      BuildContext context, String token, String newpassword) async {
    _loading = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api-golang.boilerplate.hng.tech/api/v1/auth/password-reset/verify');
    try {
      final response = await http.post(url,
          headers: {'content-Type': 'application/json'},
          body: json.encode({'token': token, 'new_password': newpassword}));

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: GlobalColors.orange,
            content: const Text(
              'Password reset successfully',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )));
        _loading = false;
        notifyListeners();
      } else {
        // handle error
      }
    } catch (e) {
// handle connection error
// ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: GlobalColors.orange,
          content: Text(
            e.toString(),
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )));
      _loading = false;
      notifyListeners();
    }
  }
}
