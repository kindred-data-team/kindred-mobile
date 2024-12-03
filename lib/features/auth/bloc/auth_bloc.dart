import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';
import 'package:kindred_app/features/auth/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UserLoginEvent>(onUserLogin);
    on<UserRegisterEvent>(onUserRegister);
  }

  void onUserLogin(UserLoginEvent event, Emitter<AuthState> emit) async {
    final AuthRepository authRepository = AuthRepository();
    final dataState = await authRepository.loginUser(event.email, event.password);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthLoginSuccess(dataState.data!.statusMessage ?? 'success'));
    }
    if (dataState is DataFailed) {
      print('failed');
      emit(AuthFailure('Login Failed', dataState.exception));
    }
  }

  void onUserRegister(UserRegisterEvent event, Emitter<AuthState> emit) async {
    final AuthRepository authRepository = AuthRepository();
    final dataState = await authRepository.registerUser(
        event.firstName, event.lastName, event.email, event.password, event.confirmPassword);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthLoginSuccess(dataState.data!.statusMessage ?? 'success'));
    }
    if (dataState is DataFailed) {
      print('failed');
      emit(AuthFailure('Login Failed', dataState.exception));
    }
  }
}
