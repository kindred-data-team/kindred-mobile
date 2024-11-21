import 'package:kindred_mobile/core/data/api/api_module.dart';
import 'package:kindred_mobile/core/infrastructure/environment/environment_variables.dart';
import 'package:logger/logger.dart';

abstract final class Api {
  static final logger = Logger();
  static final dioOptions = ApiModule.createDio(logger, EnvironmentVariables.appUrl);
}
