import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_hng11/services/custom_interceptor.dart';
import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/utils/initializations.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp.router(
          routerConfig: AppRouter.router,
          key: OneContext().key ,
          builder: OneContext().builder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme(),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent,
                  scrolledUnderElevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle.dark)),
        ),
      ),
    );
  }
}
