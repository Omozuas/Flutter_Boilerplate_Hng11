import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/initializations.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/auth/providers/language_provider.dart';
// import 'localiza/localiza_class.dart';

void main() async {
  await GetStorage.init();
  await initializeApp();

  // Make app always in portrait
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

// Ensures status bar and system navigation controls blends with the app
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: OneContext().builder,
        key: OneContext().key,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: GlobalColors
                .orange, // Set the color for CircularProgressIndicator here
          ),
          primaryColor: GlobalColors.orange, // gobal primary color
          textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            backgroundColor:
                GlobalColors.deemWhiteColor, // Dialog background color

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Dialog shape
            ),
            elevation: 10,
            // Dialog elevation
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Title text style
            ),
            contentTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey[800], // Content text style
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(GlobalColors
                  .orange), // Set the global color for the TextButton texts
            ),
          ),
        ),
      ),
    );
  }
}
