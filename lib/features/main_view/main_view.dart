import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/nav_bar_icons.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import the localization class

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
    AppRouter.router.routeInformationProvider.addListener(_watchRoute);
  }

  void _watchRoute() {
    if (AppRouter.router.routeInformationProvider.value.uri.toString() ==
        AppRoute.home) {
      _bottomBarIndex.value = 0;
    } else if (AppRouter.router.routeInformationProvider.value.uri.toString() ==
        AppRoute.products) {
      _bottomBarIndex.value = 1;
    } else if (AppRouter.router.routeInformationProvider.value.uri.toString() ==
        AppRoute.order) {
      _bottomBarIndex.value = 3;
    } else if (AppRouter.router.routeInformationProvider.value.uri.toString() ==
        AppRoute.settings) {
      _bottomBarIndex.value = 4;
    }
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    AppRouter.router.routeInformationProvider.removeListener(_watchRoute);
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
    // Access the localized strings
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      key: _scaffoldkey,
      body: widget.navigationShell,
      floatingActionButton: widget.navigationShell.currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                context.push(AppRoute.addProduct);
              },
              backgroundColor: GlobalColors.orange,
              shape: const CircleBorder(),
              child: Icon(
                Icons.add,
                color: GlobalColors.white,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              NavBar.home,
            ),
<<<<<<< HEAD
            label: localizations.home, // Localized label
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.products),
            label: localizations.products, // Localized label
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.order),
            label: localizations.orders, // Localized label
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.settings),
            label: localizations.settings, // Localized label
=======
            label: context.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.products),
            label: context.text.products,
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.order),
            label: context.orders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(NavBar.settings),
            label: context.text.settings,
>>>>>>> dev
          ),
        ],
        currentIndex: _bottomBarIndex.value,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 25,
        backgroundColor: Colors.white,
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
