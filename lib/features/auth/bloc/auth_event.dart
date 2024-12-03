part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const UserLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class UserRegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const UserRegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [firstName, lastName, email, password, confirmPassword];
}
