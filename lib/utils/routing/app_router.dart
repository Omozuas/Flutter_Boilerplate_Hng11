import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/regular_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/consumer_go_router.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.splash,
    routes: [
      ConsumerGoRoute(
        path: AppRoute.splash,
        builder: (context, state, ref) {
          return const SplashScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.companySignUp,
        builder: (context, state, ref) {
          return CompanySignUpScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.regularSignUp,
        builder: (context, state, ref) {
          return const RegularSignUpScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.login,
        builder: (context, state, ref) {
          return const LoginScreen();
        },
      ),
    ],
  );
}

class AppRoute {
  static const String splash = '/splash';
  static const String companySignUp = '/companySignUp';
  static const String regularSignUp = '/regularSignUp';
  static const String login = '/login';
}


