import 'package:dio/dio.dart';
import 'package:kindred_app/core/data/api/logging_interceptor.dart';
import 'package:logger/logger.dart';

class ApiModule {
  static const Duration _connectionTimeOut = Duration(seconds: 10);
  static const Duration _receiveTimeOut = Duration(seconds: 30);
  static const Duration _sendTimeOut = Duration(seconds: 10);

  static Dio createDio(Logger logger, String baseUrl) {
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
