import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/nav_bar_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import '../cart/screens/cart_home_screen.dart';
import '../product_listing/screens/product_screen.dart';
import '../user_home/screens/user_dashboard_ui.dart';
import '../user_setting/screens/profile_settings/account_settings.dart';

class UserMainView extends StatefulWidget {
  const UserMainView({
    super.key,
  });

  final String name = 'MainView';

  @override
  State<UserMainView> createState() => _UserMainViewState();
}

class _UserMainViewState extends State<UserMainView> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final ValueNotifier<int> _bottomBarIndex = ValueNotifier(0);

  // Method to update value
  void updateIndex(int newValue) {
    _bottomBarIndex.value = newValue;
    setState(() {});
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

  List<Widget> pages = [
    const UserDashBoardScreen(),
    const ProductScreen(),
    const CartHomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: pages[_bottomBarIndex.value],
      bottomNavigationBar: SizedBox(
        height: 75.h,
        width: width(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavigationBarItem(
                label: "Home",
                icon: NavBar.home,
                index: 0,
                isSelected: _bottomBarIndex.value == 0,
                onTap: updateIndex),
            _NavigationBarItem(
                label: "Products",
                icon: NavBar.products,
                index: 1,
                isSelected: _bottomBarIndex.value == 1,
                onTap: updateIndex),
            _NavigationBarItem(
                label: "Cart",
                icon: NavBar.order,
                index: 2,
                isSelected: _bottomBarIndex.value == 2,
                onTap: updateIndex),
            _NavigationBarItem(
              label: "Settings",
              icon: NavBar.settings,
              index: 3,
              isSelected: _bottomBarIndex.value == 3,
              onTap: updateIndex,
            ),
          ],
        ),
      ),
    );
  }

  FutureOr<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    if (_bottomBarIndex.value != 0) {
      updateIndex(0);
      return true;
    }
    return false;
  }
}

class _NavigationBarItem extends StatelessWidget {
  _NavigationBarItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: SizedBox(
          height: 61.sp,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? Colors.amber[800] : Colors.grey,
                    size: 24.sp,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(label,
                      style: CustomTextStyles.productSmallBodyTextBlack
                          .copyWith(
                              color:
                                  isSelected ? Colors.amber[800] : Colors.grey))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
