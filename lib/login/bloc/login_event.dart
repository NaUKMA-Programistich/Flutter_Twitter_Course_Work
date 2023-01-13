part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventStartProcess extends LoginEvent {}

class LoginEventSuccess extends LoginEvent {
  final AuthToken token;
  LoginEventSuccess({required this.token});
}

class LoginEventError extends LoginEvent {
  final String message;
  LoginEventError({required this.message});
}
