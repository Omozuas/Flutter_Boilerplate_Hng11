import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/nav_bar_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final String name = 'MainView';

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _bottomBardIndex = 0;
  // Initial selected drawer item
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _bottomBardIndex = index;
      widget.goBranch(index);
      _scaffoldkey.currentState?.closeDrawer();
    });
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (widget.navigationShell.currentIndex != 0) {
      _onItemTapped(0);
      return true;
    }
    return false;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(NavBar.home),
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
          currentIndex: _bottomBardIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
