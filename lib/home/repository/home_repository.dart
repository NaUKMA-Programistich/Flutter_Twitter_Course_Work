import 'dart:async';

import 'package:http/http.dart' as http;

import '../../auth/repository/auth_repository.dart';

class HomeRepository {
  final AuthRepository authRepository;

  HomeRepository({required this.authRepository});

  Future<http.Response> getHomeTimeline() async {
    const url = 'https://api.twitter.com/1.1/statuses/home_timeline.json';
    final params = {
      'count': '200',
      'include_entities': 'true',
      'exclude_replies': 'false',
    };
    final oauthHeader = await authRepository.getOauthToken('GET', url, params);

    return http.get(
      Uri.parse(url).replace(queryParameters: params),
      headers: <String, String>{
        'Host': 'api.twitter.com',
        'Authorization': 'OAuth $oauthHeader',
      },
    );
  }
}
