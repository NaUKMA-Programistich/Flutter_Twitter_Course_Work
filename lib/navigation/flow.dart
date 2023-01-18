import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter/navigation/route.dart';
import 'package:go_router/go_router.dart';

import '../login/page/login_page.dart';
import '../main/page/main_page.dart';

GoRouter navigationFlow(String startRoute) {
  return GoRouter(
    initialLocation: startRoute,
    routes: <GoRoute>[
      GoRoute(
        path: NavigationRoute.loginScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
          path: NavigationRoute.mainScreen,
          builder: (BuildContext context, GoRouterState state) {
            final String tabName = state.params[NavigationRoute.mainParam] ??
                NavigationRoute.accountScreen;

            return MainPage(tabName: tabName);
          }),
    ],
  );
}

String firstScreenRoute(bool isTokenExist) {
  if (isTokenExist) {
    return NavigationRoute.homeScreen;
  } else {
    return NavigationRoute.loginScreen;
  }
}
