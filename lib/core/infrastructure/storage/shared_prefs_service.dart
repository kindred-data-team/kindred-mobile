


import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/common/utils/string_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPrefsService {
  
  Future<bool> clear(String key);

  Future<bool> setVal(String key,dynamic val);

  Future<Object?> getVal(String key);

}

@LazySingleton(as: SharedPrefsService)
class SharedPrefServiceImpl implements SharedPrefsService{
  final SharedPreferences _prefs;

  const SharedPrefServiceImpl(this._prefs);

  @override
  Future<bool> clear(String key)async{ 
     assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');
    
    return await _prefs.remove(key);
  }

  @override
  Future<Object?> getVal(String key)async {
    assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');

    return  _prefs.get(key);
  }


  @override
  Future<bool> setVal(String key, Object? val) async {
    assert(val != null,"Val must not be empty");
     assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');
      switch (val) {
      case int _:  return await _prefs.setInt(key, val);
      case String _:  return await _prefs.setString(key, val);
      case bool _: return await _prefs.setBool(key, val);
      default:
         return await _prefs.setString(key, val as String);
    }
  }
  
}