import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_twitter/home/repository/home_repository.dart';
import 'package:meta/meta.dart';

import '../models/home_timeline.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeLoading()) {
    on<HomeEventStartProcess>((event, emit) async {
      final response = await homeRepository.getHomeTimeline();
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Tweet> tweets = data.map((e) => Tweet.fromJson(e)).toList();
        emit(HomeLoaded(tweets));
      } else {
        emit(HomeError(response.body));
      }
    });
  }
}
