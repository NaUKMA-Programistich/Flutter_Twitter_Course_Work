part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Tweet> tweets;

  HomeLoaded(this.tweets);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
