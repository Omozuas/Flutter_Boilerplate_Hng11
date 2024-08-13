import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/main_view/main_view_provider.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/nav_bar_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final String name = 'MainView';

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    BackButtonInterceptor.add(
      myInterceptor,
      name: widget.name,
      context: context,
    );
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  void goBranch(WidgetRef ref, int index) {
    final currentIndex = ref.read(bottomNavBarIndexProvider);
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == currentIndex,
    );
    ref.read(bottomNavBarIndexProvider.notifier).setIndex(index);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final bottomBarIndex = ref.watch(bottomNavBarIndexProvider);

    return Scaffold(
      key: _scaffoldkey,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              NavBar.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(NavBar.products),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(NavBar.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(NavBar.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: bottomBarIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          goBranch(ref, index);
        },
      ),
    );
  }

  FutureOr<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    if (widget.navigationShell.currentIndex != 0) {
      goBranch(ref, 0);
      return true;
    }
    return false;
  }
}
