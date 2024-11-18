

import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PlatformModule {
  @lazySingleton

  @lazySingleton
  LocalAuthentication get localAuth => LocalAuthentication();

  @preResolve
  Future<SharedPreferences> get sharedPrefs  =>  SharedPreferences.getInstance();
}