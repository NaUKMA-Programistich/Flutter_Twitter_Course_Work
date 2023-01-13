import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_twitter/auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/flow.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final preferences = await SharedPreferences.getInstance();
  final authRepository = AuthRepository(preferences);
  final isExistToken = await authRepository.isTokenExist();

  final startNavigationRoute = firstScreenRoute(isExistToken);
  FlutterNativeSplash.remove();

  runApp(App(
      authRepository: authRepository,
      startNavigationRoute: startNavigationRoute));
}

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.authRepository,
      required this.startNavigationRoute})
      : super(key: key);

  final AuthRepository authRepository;
  final String startNavigationRoute;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => authRepository,
          ),
        ],
        child: MaterialApp.router(
          routerConfig: navigationFlow(startNavigationRoute),
          theme: ThemeData(primarySwatch: Colors.blue),
        ));
  }
}
