import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kindred_app/common/exceptions/api_exception.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';
import 'package:kindred_app/features/auth/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UserLoginEvent>(onUserLogin);
    on<UserRegisterEvent>(onUserRegister);
    on<ForgotPasswordRequestEvent>(onForgotPasswordRequest);
  }
  final AuthRepository authRepository = AuthRepository();

  void onUserLogin(UserLoginEvent event, Emitter<AuthState> emit) async {
    final dataState = await authRepository.loginUser(event.email, event.password);
    if (dataState is DataSuccess) {
      emit(AuthLoginSuccess(dataState.data.toString()));
    }
    if (dataState is DataFailed) {
      print('failed');
      emit(AuthFailure('Login Failed', dataState.exception));
    }
  }

  void onUserRegister(UserRegisterEvent event, Emitter<AuthState> emit) async {
    final dataState = await authRepository.registerUser(
        event.firstName, event.lastName, event.email, event.password, event.confirmPassword);
    if (dataState is DataSuccess) {
      emit(AuthRegisterSuccess(dataState.data!.toString()));
    }
    if (dataState is DataFailed) {
      print('failed');
      emit(AuthFailure('Register Failed', dataState.exception));
    }
  }

  void onForgotPasswordRequest(ForgotPasswordRequestEvent event, Emitter<AuthState> emit) async {
    final dataState = await authRepository.forgotPasswordRequest(event.email);
    if (dataState is DataSuccess) {
      emit(AuthForgotPasswordSuccess(dataState.data != '' ? dataState.data.toString() : 'Success'));
    }
    if (dataState is DataFailed) {
      emit(AuthFailure('Forgot Password Failed', dataState.exception));
    }
  }
}
