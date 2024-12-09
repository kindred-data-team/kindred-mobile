import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kindred_app/common/exceptions/api_exception.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';
import 'package:kindred_app/features/auth/data/service/auth_service.dart';

class AuthRepository {
  final _authService = AuthService();
  final storage = const FlutterSecureStorage();

  Future<DataState> loginUser(String email, String password) async {
    try {
      final response = await _authService.loginUser(email, password);
      if (response.statusCode == HttpStatus.ok) {
        await storage.write(key: 'accessToken', value: response.data['access_token'].toString());
        return DataSuccess(response);
      } else {
        return DataFailed(ApiException(
          message: response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> registerUser(
      String firstName, String lastName, String email, String password, String confirmPassword) async {
    try {
      final response = await _authService.registerUser(firstName, lastName, email, password, confirmPassword);
      if (response.statusCode == HttpStatus.ok) {
        print("ok daw");
        await storage.write(key: 'accessToken', value: response.data['access_token'].toString());
        return DataSuccess(response);
      } else {
        print("ok'nt daw");
        return DataFailed(ApiException(message: response.statusMessage ?? ''));
      }
    } on ApiException catch (e) {
      print("oksss daw");
      return DataFailed(e);
    }
  }

  Future<DataState> forgotPasswordRequest(String email) async {
    try {
      final response = await _authService.forgotPasswordRequest(email);
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(response);
      } else {
        return DataFailed(ApiException(message: response.statusMessage ?? ''));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }
}
