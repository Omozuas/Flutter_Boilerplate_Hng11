import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/auth/screen/splash_screen.dart';

void main() async {
  setupLocator();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        home: const SplashScreen(),
      ),

    );
  }
}
