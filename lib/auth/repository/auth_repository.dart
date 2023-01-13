import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_token.dart';

const String accessTokenKey = 'access_token_key';
const String secretTokenKey = 'secret_token_key';

class AuthRepository {
  final SharedPreferences sharedPreferences;

  AuthRepository(this.sharedPreferences);

  Future<void> saveToken(AuthToken token) async {
    sharedPreferences.setString(accessTokenKey, token.accessToken);
    sharedPreferences.setString(secretTokenKey, token.secretToken);
  }

  Future<bool> isTokenExist() async {
    return sharedPreferences.getString(accessTokenKey) != null &&
        sharedPreferences.getString(secretTokenKey) != null;
  }

  Future<AuthToken?> getToken() async {
    final accessToken = sharedPreferences.getString(accessTokenKey);
    final secretToken = sharedPreferences.getString(secretTokenKey);
    if (accessToken != null && secretToken != null) {
      return AuthToken(accessToken, secretToken);
    }
    return null;
  }
}
