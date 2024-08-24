import 'package:flutter_boilerplate_hng11/features/auth/screen/company_signup_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/forgot_password.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/reset_password.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/single_user_signup.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/splash_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_screen.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/verification_success.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/main_view/main_view.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/features/order/screens/order_detail_screen.dart';
import 'package:flutter_boilerplate_hng11/features/order/screens/order_home_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/app_product/add_product_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_by_catetory_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_detail/product_details_screen.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_detail/provider/product_detail.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';
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
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/ref_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/consumer_go_router.dart';
import 'package:go_router/go_router.dart';

import '../../features/user_setting/models/subscription_model.dart';

import '../../features/main_view/user_main_view.dart';
import '../../features/notification/screens/notification_home_screen.dart';

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
        path: AppRoute.forgotPassword,
        builder: (context, state, ref) {
          return const ForgotPasswordScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.verificationScreen,
        builder: (context, state, ref) {
          final email = state.pathParameters['email'];
          return VerificationScreen(
            email: email ?? '',
          );
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.verificationSuccess,
        builder: (context, state, ref) {
          return const VerificationSuccessScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.resetPassword,
        builder: (context, state, ref) {
          final email = state.pathParameters['email'];
          return ResetPassword(
            email: email ?? '',
          );
        },
      ),
      ConsumerGoRoute(
        path: '${AppRoute.products}/:id',
        builder: (context, state, ref) {
          ref.read(productDetailProvider.notifier).productId =
              state.pathParameters['id']!;
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
        path: AppRoute.addProduct,
        builder: (context, state, ref) {
          return const AddProductScreen();
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
      // ConsumerGoRoute(
      //   path: AppRoute.upgradePlanCheckout,
      //   builder: (context, state, ref) {
      //     final plan = state.extra as SubscriptionPlan;
      //     return UpgradePlanCheckoutScreen(plan: plan);
      //   },
      // ),
      ConsumerGoRoute(
        path: AppRoute.languageAndRegionScreen,
        builder: (context, state, ref) {
          return const LanguageAndRegionScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.editProfileScreen,
        builder: (context, state, ref) {
          final user = ref.watch(profileProvider).user.sureValue;
          return EditProfileScreen(user: user);
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
      ConsumerGoRoute(
        path: AppRoute.userHome,
        builder: (context, state, ref) {
          return const UserMainView();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.notification,
        builder: (context, state, ref) {
          return const NotificationHomeScreen();
        },
      ),
      ConsumerGoRoute(
        path: AppRoute.productsByCategory,
        builder: (context, state, ref) {
          return const ProductsByCategory();
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.home,
              builder: (context, state, ref) => const HomeScreen(),
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
              path: AppRoute.ordersDetail,
              builder: (context, state, ref) => OrderDetailScreen(
                order: Order(
                    number: 00,
                    image: 'assets/images/png/product_listing/sport-shoes.png',
                    deliveryDate: "20-Aug-2024",
                    deliveryTime: "24-Aug-2024",
                    deliveryText: "Delivered on 19th August",
                    deliveryColor: GlobalColors.green),
                image: "assets/images/png/product_listing/sport-shoes.png",
              ),
            ),
          ]),
          StatefulShellBranch(routes: [
            ConsumerGoRoute(
              path: AppRoute.order,
              builder: (context, state, ref) {
                return const OrderHomeScreen();
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
  static const String forgotPassword = '/forgotPassword';
  static const String verificationScreen = '/verificationScreen/:email';
  static const String verificationSuccess = '/verificationSuccess';
  static const String resetPassword = '/resetPassword/:email';
  static const String cart = '/cart';
  static const String ordersDetail = '/ordersDetail';
  static const String order = '/order';
  static const String notification = '/notification';

  static const String settings = '/settings';
  static const String userSettings = '/user-settings';

  static const String products = '/products';
  static const String userProducts = '/user-products';
  static const String addProduct = '/add-product';

  static const String home = '/home';
  static const String userHome = '/user-home';

  static const String createRole = '/org-settings/create-role';
  static const String members = '/org-settings/members';
  static const String rolesScreen = '/org-settings/roles-screen';
  static const String subscriptionCheckout =
      '/org-settings/subscription-checkout';
  static const String subscriptionsScreen =
      '/org-settings/subscriptions-screen';

  static const String upgradePlanCheckout = '/upgrade-plan-checkout';

  static const String languageAndRegionScreen =
      '/profile-settings/language-and-region-screen';
  static const String editProfileScreen =
      '/profile-settings/edit-profile-screen';
  static const String notificationScreen =
      '/profile-settings/notification_screen';
  static const String updatePassword = '/profile-settings/update_password';
  static const String productsByCategory = '/products-by-category';
}
