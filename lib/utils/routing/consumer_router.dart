import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
