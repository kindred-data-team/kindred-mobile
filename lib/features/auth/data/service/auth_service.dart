import 'package:dio/dio.dart';
import 'package:kindred_app/core/data/api/api.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';

class AuthService {
  Future<DataState> loginUser(final String email, final String password) async {
    try {
      Response response;
      response = await Api.dioOptions.post('/api/auth/login', data: {"email": email, "password": password});
      return DataSuccess(response);
    } on DioException catch (e) {
      print(e);
      print(e.response);
      print(e.error);
      print(e.type);
      return DataFailed(e);
      // Handle Dio-specific errors
      // if (e.type == DioExceptionType.values) {
      //   // Handle response errors (e.g., server returned a non-200 status code)
      //   return DataFailed('Server error: ${e.response?.statusCode}');
      // } else if (e.type == DioExceptionType.connectTimeout) {
      //   // Handle connection timeout error
      //   return DataFailed('Connection timeout, please try again later.');
      // } else if (e.type == DioExceptionType.receiveTimeout) {
      //   // Handle receive timeout error
      //   return DataFailed('Timeout receiving data from the server.');
      // } else if (e.type == DioExceptionType.cancel) {
      //   // Handle cancellation errors
      //   return DataFailed('Request was canceled.');
      // } else {
      //   // Catch any other unexpected DioError types
      //   return DataFailed('Unexpected error occurred: ${e.message}');
      // }
    } catch (e) {
      return DataFailed(DioException(requestOptions: RequestOptions(data: e)));
    }
  }

  Future<Response> registerUser(final String firstName, final String lastName, final String email,
      final String password, final String confirmPassword) async {
    Response response;
    response = await Api.dioOptions.post('api/auth/register', data: {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword
    });
    return response;
  }
}
