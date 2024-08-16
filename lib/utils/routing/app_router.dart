import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/single_user_signup.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/features/cart/screens/cart_home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/main_view/main_view.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_details_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/proucts_home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/create_role.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/members.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/roles_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscription_checkout.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscriptions_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/account_settings.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/edit_profile_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/language_and_region_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/notification_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/update_password.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/consumer_go_router.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.home,
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
      ConsumerGoRoute(
        path: AppRoute.createRole,
        builder: (context, state, ref) {
          return const CreateRole();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.members,
        builder: (context, state, ref) {
          return const MembersSettings();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.rolesScreen,
        builder: (context, state, ref) {
          return const RoleScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.subscriptionCheckout,
        builder: (context, state, ref) {
          return const SubscriptionCheckout(plan: SubscriptionPlan.free);
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.subscriptionsScreen,
        builder: (context, state, ref) {
          return const SubscriptionsScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.languageAndRegionScreen,
        builder: (context, state, ref) {
          return const LanguageAndRegionScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.editProfileScreen,
        builder: (context, state, ref) {
          return const EditProfileScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.notificationScreen,
        builder: (context, state, ref) {
          return const NotificationsScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.updatePassword,
        builder: (context, state, ref) {
          return const UpdatePassword();
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

  static const String createRole = '/org-settings/create-role';
  static const String members = '/org-settings/members';
  static const String rolesScreen = '/org-settings/roles-screen';
  static const String subscriptionCheckout =
      '/org-settings/subscription-checkout';
  static const String subscriptionsScreen =
      '/org-settings/subscriptions-screen';

  static const String languageAndRegionScreen =
      '/profile-settings/language-and-region-screen';
  static const String editProfileScreen =
      '/profile-settings/edit-profile-screen';
  static const String notificationScreen =
      '/profile-settings/notification_screen';
  static const String updatePassword = '/profile-settings/update_password';
}
