import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/regular_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/members.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/consumer_go_router.dart';
import 'package:go_router/go_router.dart';

import '../../features/user_setting/screens/integrations_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.integration,
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
      ConsumerGoRoute(
        path: AppRoute.membersSettings,
        builder: (context, state, ref) {
          return const MembersSettings();
        },
      ),

      ConsumerGoRoute(
        path: AppRoute.integration, // Add the new route path
        builder: (context, state, ref) {
          return const IntegrationScreen(); // Return the IntegrationScreen here
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
  static const String membersSettings = '/membersSettings';
  static const String integration = '/integration';
}


