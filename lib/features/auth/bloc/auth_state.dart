part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String message;

  const AuthLoginSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthRegisterSuccess extends AuthState {
  final String message;
  const AuthRegisterSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthForgotPasswordSuccess extends AuthState {
  final String message;

  const AuthForgotPasswordSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthFailure extends AuthState {
  final String error;
  final ApiException? exception;
  const AuthFailure(this.error, this.exception);

  @override
  List<Object> get props => [error, exception ?? const ApiException(message: 'Error')];
}
