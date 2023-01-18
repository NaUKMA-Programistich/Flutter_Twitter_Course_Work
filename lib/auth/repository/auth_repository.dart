import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_twitter/utils/constants.dart';
import 'package:flutter_twitter/utils/extensions.dart';
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

  Future<String> getOauthToken(
      String method, String url, Map<String, String> data) async {
    final accessToken = sharedPreferences.getString(accessTokenKey)!;
    const consumerKey = TwitterConstants.consumerApiKey;

    String timestamp = DateTime.now().timestamp();
    String nonce = Random().generateNonce();

    Map<String, String> authData = {
      'oauth_consumer_key': consumerKey,
      'oauth_token': accessToken,
      'oauth_signature_method': 'HMAC-SHA1',
      'oauth_version': '1.0',
      'oauth_timestamp': timestamp,
      'oauth_nonce': nonce,
    };

    String signature = generateSignature(method, url, {...authData, ...data});

    authData['oauth_signature'] = signature;

    return authData.toReadString();
  }

  String generateSignature(
      String method, String url, Map<String, String> data) {
    final accessSecret = sharedPreferences.getString(secretTokenKey)!;
    const consumerSecret = TwitterConstants.consumerApiSecretKey;

    List<String> list = data.keys
        .map((key) => "${(key).encode()}=${(data[key]!).encode()}")
        .toList()
      ..sort();

    String parameters = (list.join('&')).encode();
    String signatureBaseString = "$method&${url.encode()}&$parameters";
    String signatureKey =
        "${(consumerSecret.encode())}&${(accessSecret.encode())}";

    List<int> signature = Hmac(sha1, utf8.encode(signatureKey))
        .convert(utf8.encode(signatureBaseString))
        .bytes;
    return base64.encode(signature);
  }
}
