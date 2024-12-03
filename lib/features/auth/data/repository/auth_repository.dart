import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kindred_app/common/exceptions/api_exception.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';
import 'package:kindred_app/features/auth/data/service/auth_service.dart';

class AuthRepository {
  final _authService = AuthService();
  final storage = const FlutterSecureStorage();

  Future<DataState<Response>> loginUser(String email, String password) async {
    try {
      final response = await _authService.loginUser(email, password);
      if (response.statusCode == HttpStatus.ok) {
        await storage.write(key: 'accessToken', value: response.data['access_token'].toString());
        Response res = response;

        return DataSuccess(res);
      } else {
        return DataFailed(ApiException(
          message: response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<Response>> registerUser(
      String firstName, String lastName, String email, String password, String confirmPassword) async {
    try {
      final response = await _authService.registerUser(firstName, lastName, email, password, confirmPassword);
      if (response.statusCode == HttpStatus.ok) {
        await storage.write(key: 'accessToken', value: response.data['access_token'].toString());
        Response res = response;
        return DataSuccess(res);
      } else {
        return DataFailed(ApiException(
          message: response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }
}
