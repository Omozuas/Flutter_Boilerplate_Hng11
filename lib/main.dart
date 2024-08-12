import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/signup_screen.dart';
import 'package:flutter_boilerplate_hng11/services/request_types.dart';
import 'package:google_fonts/google_fonts.dart';

late ApiService apiService;

void main() {
  apiService = ApiService(
      baseUrl: 'https://staging.api-nestjs.boilerplate.hng.tech/api/v1');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        home: const SignupScreen());
  }
}
