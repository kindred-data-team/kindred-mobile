import 'package:dio/dio.dart';
import 'package:kindred_app/core/data/api/api.dart';

class AuthService {
  Future<Response> loginUser(final String email, final String password) async {
    Response response;
    response = await Api.dioOptions.get('/api/auth/login', data: {"email": email, "password": password});
    return response;
  }

  Future<Response> registerUser(final String firstName, final String lastName, final String email,
      final String password, final String confirmPassword) async {
    Response response;
    response = await Api.dioOptions.get('api/auth/register', data: {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword
    });
    return response;
  }
}
