import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter/login/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../auth/repository/auth_repository.dart';
import '../../navigation/route.dart';
import '../widgets/twitter_login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authRepository = context.read<AuthRepository>();
        return LoginBloc(authRepository: authRepository);
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          List<Widget> bodyContent = [];

          if (state is LoginInitial) {
            bodyContent.add(const TwitterLoginWidget());
          }

          if (state is LoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(NavigationRoute.accountScreen);
            });
          }

          if (state is LoginLoading) {
            bodyContent.add(const CircularProgressIndicator());
          }

          return Scaffold(
            appBar: AppBar(title: const Text('Login Screen')),
            body: Column(
              children: bodyContent,
            ),
          );
        },
      ),
    );
  }
}
