import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter/login/bloc/login_bloc.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../auth/models/auth_token.dart';
import '../../utils/constants.dart';

class TwitterLoginWidget extends StatelessWidget {
  const TwitterLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return ElevatedButton(
      child: const Text('Login via Twitter'),
      onPressed: () async {
        bloc.add(LoginEventStartProcess());
        final twitterLogin = TwitterLogin(
          apiKey: TwitterConstants.consumerApiKey,
          apiSecretKey: TwitterConstants.consumerApiSecretKey,
          redirectURI: TwitterConstants.redirectURI,
        );
        final authResult = await twitterLogin.loginV2();
        switch (authResult.status) {
          case TwitterLoginStatus.loggedIn:
            final accessToken = authResult.authToken;
            final accessTokenSecret = authResult.authTokenSecret;
            if (accessToken != null && accessTokenSecret != null) {
              final token = AuthToken(accessToken, accessTokenSecret);
              bloc.add(LoginEventSuccess(token: token));
            } else {
              bloc.add(LoginEventError(message: 'Access token is null'));
            }
            break;
          case TwitterLoginStatus.cancelledByUser:
            bloc.add(LoginEventError(message: 'Login cancelled by user'));
            break;
          case TwitterLoginStatus.error:
            bloc.add(LoginEventError(message: '${authResult.errorMessage}'));
            break;
          case null:
            bloc.add(LoginEventError(message: 'Login status is null'));
            break;
        }
      },
    );
  }
}
