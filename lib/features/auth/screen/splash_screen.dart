import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

import '../../../services/service_locator.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  static GetStorage box = locator<GetStorage>();

  @override
  void initState() {
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
            context.go(AppRoute.home);
          } else {
            context.go(AppRoute.login);
          }
        },
      );
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
            AppLocalizations.of(context)!.appName, 
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: GlobalColors.darkOne,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2.w,
            ),
          )
        ],
      ),
    );
  }
}
