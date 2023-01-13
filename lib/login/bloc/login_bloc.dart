import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter/auth/models/auth_token.dart';
import 'package:flutter_twitter/auth/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginEventStartProcess>((event, emit) {
      emit(LoginLoading());
    });

    on<LoginEventSuccess>((event, emit) {
      authRepository.saveToken(event.token);
      emit(LoginSuccess());
    });

    on<LoginEventError>((event, emit) {
      emit(LoginInitial());
    });
  }
}
