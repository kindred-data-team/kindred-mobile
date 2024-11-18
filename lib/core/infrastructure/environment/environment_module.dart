import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/dependency_injection.dart';
import 'package:kindred_mobile/core/infrastructure/environment/environment_variables.dart';
import 'package:logger/logger.dart';

@module
abstract class EnvironmentModule {
  @lazySingleton
  @appUrl
  String getAppUrl(EnvironmentVariables environmentVariables) => environmentVariables.appUrl;

  @lazySingleton
  Logger logger() => Logger(level: Level.all);
}
