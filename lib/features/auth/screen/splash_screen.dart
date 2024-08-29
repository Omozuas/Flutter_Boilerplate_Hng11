import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate_hng11/l10n/app_localizations.dart'; // Import for localization

<<<<<<< HEAD
class SplashScreen extends StatefulWidget {
=======

import '../../../services/service_locator.dart';

class SplashScreen extends ConsumerStatefulWidget {
>>>>>>> dev
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
<<<<<<< HEAD
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRoute.companySignUp);
=======
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      if (box.read('accessToken') == null) {
        context.go(AppRoute.singleUserSignUp);
        return;
      }

      if (box.read('rememberMe') == null || !box.read('rememberMe')) {
        context.go(AppRoute.login);
        return;
      }

      ref.read(authProvider.notifier).loadStoredUser().then(
        (successful) {
          if (successful) {
            if (mounted) {
              context.go(AppRoute.home);
            }
          } else {
            if (mounted) {
              context.go(AppRoute.login);
            }
          }
        },
      );
>>>>>>> dev
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 211.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
<<<<<<< HEAD
            AppLocalizations.of(context)!.appTitle, // Localized text
=======
            'HNG Boilerplate', // Localized app name
>>>>>>> dev
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: GlobalColors.darkOne,
            ),
          )
        ],
      ),
    );
  }
}

