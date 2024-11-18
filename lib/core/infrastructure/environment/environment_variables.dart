import 'package:injectable/injectable.dart';

abstract interface class EnvironmentVariables {
  String get appUrl;
}

@LazySingleton(as: EnvironmentVariables)
class EnvironmentVariablesImpl implements EnvironmentVariables {
  @override
  String get appUrl => const String.fromEnvironment('appServerUrl');
}
