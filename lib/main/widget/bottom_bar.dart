import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/route.dart';

class BottomBarWidget extends StatefulWidget {
  final String tabName;
  const BottomBarWidget({super.key, required this.tabName});

  int processCurrentTab() {
    switch (tabName) {
      case NavigationRoute.accountParam:
        return 1;
      case NavigationRoute.homeParam:
        return 0;
      default:
        return 0;
    }
  }

  @override
  State<StatefulWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int selectedIndex = -1;

  List<BottomNavigationBarItem> buildItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: 'Account',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == -1) {
      selectedIndex = widget.processCurrentTab();
    }

    void onTap(int index) {
      setState(() {
        selectedIndex = index;
      });

      switch (index) {
        case 0:
          return context.go(NavigationRoute.homeScreen);
        case 1:
          return context.go(NavigationRoute.accountScreen);
        default:
          return context.go(NavigationRoute.homeScreen);
      }
    }

    return BottomNavigationBar(
      items: buildItems(),
      onTap: onTap,
      currentIndex: selectedIndex,
    );
  }
}
