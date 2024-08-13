import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/main_view/main_view_provider.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/nav_bar_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final String name = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final ValueNotifier<int> _bottomBarIndex = ValueNotifier(0);

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

  void goBranch(int index) {
    final currentIndex = _bottomBarIndex.value;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == currentIndex,
    );
    _bottomBarIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
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
        currentIndex: _bottomBarIndex.value,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          goBranch(index);
        },
      ),
    );
  }

  FutureOr<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    if (widget.navigationShell.currentIndex != 0) {
      goBranch(0);
      return true;
    }
    return false;
  }
}
