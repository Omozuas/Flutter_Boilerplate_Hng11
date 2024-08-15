import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/single_user_signup.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/features/cart/screens/cart_home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/main_view/main_view.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_details_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/proucts_home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/account_settings.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/consumer_go_router.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.settings,
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
        path: AppRoute.singleUserSignUp,
        builder: (context, state, ref) {
          return const SingleUserSignUpScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.login,
        builder: (context, state, ref) {
          return const LoginScreen();
        },
      ),
      ConsumerGoRoute(
        path: '${AppRoute.products}/:id',
        builder: (context, state, ref) {
          return const ProductDetailsScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.home,
              builder: (context, state, ref) => const ProductHomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.products,
              builder: (context, state, ref) => const ProductScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.cart,
              builder: (context, state, ref) {
                return const CartHomeScreen();
              },
            ),
          ]),
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.settings,
              builder: (context, state, ref) => const SettingsScreen(),
            ),
          ]),
        ],
        builder: (context, state, navigationShell) => MainView(
          navigationShell: navigationShell,
        ),
      ),
    ],
  );
}

class AppRoute {
  static const String splash = '/splash';
  static const String companySignUp = '/companySignUp';
  static const String singleUserSignUp = '/singleUserSignUp';
  static const String login = '/login';
  static const String cart = '/cart';

  static const String settings = '/settings';

  static const String products = '/products';

  static const String home = '/home';
}






