import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/dependency_injection.config.dart';

const Named appUrl = Named('appUrl');

@InjectableInit(
  initializerName: r'$register',
  preferRelativeImports: false,
  asExtension: false,
)
abstract final class DependencyInjection {
  static final GetIt instance = GetIt.instance..allowReassignment = true;

  static Future<void> registerDependencies() async {
    $register(instance);
  }
}
