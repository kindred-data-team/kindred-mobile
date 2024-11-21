import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger;

  LoggingInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String tag = '[REQ#${shortHash(options)}]';
    final Uri reqUri = options.uri;
    _logger
      ..d('$tag Sending ${options.method.toUpperCase()} ${reqUri.path + reqUri.query}')
      ..d('$tag Host: ${reqUri.host}')
      ..d('$tag Scheme: ${reqUri.scheme.toUpperCase()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final String tag = '[REQ#${shortHash(response.requestOptions)}]';

    if (response.statusCode != null && response.statusMessage != null) {
      _logger.d('$tag Success: ${response.statusCode} ${response.statusMessage}');
    }

    _logBody(tag, response.data);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode != null && err.response?.statusMessage != null) {
      final String tag = '[RES#${shortHash(err.requestOptions)}]';
      _logger.e('$tag Failed: ${err.response?.statusCode} ${err.response?.statusMessage}');
    }

    super.onError(err, handler);
  }

  void _logBody(String tag, Object? body) {
    if (body is! Map && body is! List) {
      return;
    }

    const JsonEncoder encoder = JsonEncoder.withIndent('    ');
    _logger.d('$tag Body: ${encoder.convert(body)}');
  }
}
