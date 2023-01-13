import 'package:flutter/material.dart';
import 'package:flutter_twitter/feed/page/home_page.dart';

import '../../account/page/account_page.dart';
import '../../navigation/route.dart';
import '../widget/bottom_bar.dart';

class MainPage extends StatelessWidget {
  final String tabName;
  const MainPage({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    Widget processCurrentTab() {
      switch (tabName) {
        case NavigationRoute.accountParam:
          return const AccountPage();
        case NavigationRoute.homeParam:
          return const HomePage();
        default:
          return const AccountPage();
      }
    }

    return Column(children: [
      Expanded(child: processCurrentTab()),
      BottomBarWidget(tabName: tabName)
    ]);
  }
}
