import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/data/api/logging_interceptor.dart';
import 'package:kindred_mobile/core/dependency_injection.dart';
import 'package:logger/logger.dart';

@module
abstract class ApiModule {
  static const Duration _connectionTimeOut = Duration(seconds: 10);
  static const Duration _receiveTimeOut = Duration(seconds: 30);
  static const Duration _sendTimeOut = Duration(seconds: 10);

  @injectable
  Dio createDio(Logger logger, @appUrl String baseUrl) {
    return Dio(
      BaseOptions(
        connectTimeout: _connectionTimeOut,
        receiveTimeout: _receiveTimeOut,
        sendTimeout: _sendTimeOut,
        baseUrl: baseUrl,
      ),
    )..interceptors.addAll([
        LoggingInterceptor(logger),
      ]);
  }
}
