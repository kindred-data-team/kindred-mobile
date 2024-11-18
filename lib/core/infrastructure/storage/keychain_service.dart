

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/common/utils/string_util.dart';

abstract interface class KeychainService {
  Future<void> add(String key, String value);

  Future<void> clear(String key);

  Future<void> clearAll();

  Future<String?> getValue(String key);
}

@LazySingleton(as: KeychainService)
class KeychainServiceImpl implements KeychainService {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> add(String key, String value) {
    assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');
    assert(!StringUtil.isNullOrEmpty(value), 'Key cannot be null or empty');

    return _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> clear(String key) {
    assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');

    return _secureStorage.delete(key: key);
  }

  @override
  Future<void> clearAll() => _secureStorage.deleteAll();

  @override
  Future<String?> getValue(String key) {
    assert(!StringUtil.isNullOrEmpty(key), 'Key cannot be null or empty');

    return _secureStorage.read(key: key);
  }
}
