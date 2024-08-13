import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A custom route class that extends `GoRoute` to integrate Riverpod's `WidgetRef`
/// directly into the route builder. This allows you to access Riverpod providers
/// in your route builders seamlessly.
///
/// The `ConsumerGoRoute` wraps the route's widget in a `Consumer` to provide
/// the `WidgetRef` for accessing Riverpod's state management features.
///
/// Example usage:
/// ```dart
/// final GoRouter _router = GoRouter(
///   routes: [
///     ConsumerGoRoute(
///       path: '/',
///       builder: (context, state, ref) {
///         final someValue = ref.watch(someProvider);
///         return HomeScreen(value: someValue);
///       },
///     ),
///     ConsumerGoRoute(
///       path: '/details',
///       builder: (context, state, ref) {
///         final anotherValue = ref.watch(anotherProvider);
///         return DetailsScreen(value: anotherValue);
///       },
///     ),
///   ],
/// );
///
/// void main() {
///   runApp(ProviderScope(child: MyApp()));
/// }
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp.router(
///       routerConfig: _router,
///     );
///   }
/// }
/// ```
///
/// Parameters:
/// - `path`: The route path as a string. This is the URL path that will match this route.
/// - `builder`: A function that builds the widget for this route, given the `BuildContext`,
///   `GoRouterState`, and `WidgetRef`. The `WidgetRef` allows you to access Riverpod providers.
/// - `routes`: A list of sub-routes that this route can have as children.
///
/// The `builder` parameter must be provided and it is where you construct the widget
/// that should be displayed when this route is navigated to.

class ConsumerGoRoute extends GoRoute {
  ConsumerGoRoute({
    required super.path,
    required Widget Function(BuildContext, GoRouterState, WidgetRef) builder,
    List<GoRoute>? routes,
  }) : super(
          routes: routes ?? [],
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: Consumer(
                builder: (context, ref, child) {
                  return builder(context, state, ref);
                },
              ),
            );
          },
        );
}
