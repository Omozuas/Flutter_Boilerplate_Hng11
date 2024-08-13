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
    ],
  );
}

class AppRoute {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String productListing = '/product_listing';
  static const String cart = '/cart';
  static const String settings = '/settings';
}
