import 'package:dio/dio.dart';
import 'package:kindred_app/core/data/api/api.dart';

class AuthService {
  Future<Response> loginUser(final String email, final String password) async {
    try {
      Response response;
      response = await Api.dioOptions.post('/api/auth/login', data: {"email": email, "password": password});
      return response;
    } on DioException catch (e) {
      return e.response!;
    } catch (e) {
      return e as Response;
    }
  }

  Future<Response> registerUser(final String firstName, final String lastName, final String email,
      final String password, final String confirmPassword) async {
    try {
      Response response;
      response = await Api.dioOptions.post('/api/auth/register', data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword
      });
      print('hello');
      return response;
    } on DioException catch (e) {
      print('not hello');
      return e.response!;
    } catch (e) {
      return e as Response;
    }
  }

  Future<Response> forgotPasswordRequest(final String email) async {
    try {
      Response response;
      response = await Api.dioOptions.post('/api/auth/forgot-password', data: {"email": email});
      return response;
    } on DioException catch (e) {
      return e.response!;
    } catch (e) {
      return e as Response;
    }
  }
}
