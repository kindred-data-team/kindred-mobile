import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session extends ChangeNotifier {
  static final Session _instance = Session._();

  Session._();
  factory Session() => _instance;

  late SharedPreferences _prefs;
  late bool _isLoggedIn;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    _isLoggedIn = _prefs.getBool(_PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> login() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    _prefs.setString(_PrefKeys.accessToken, token!);
    _prefs.setBool(_PrefKeys.isLoggedIn, true);
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    const storage = FlutterSecureStorage();
    _prefs.setBool(_PrefKeys.isLoggedIn, false);
    _isLoggedIn = false;
    _prefs.setString(_PrefKeys.accessToken, '');
    storage.delete(key: 'accessToken');
    notifyListeners();
  }
}

abstract class _PrefKeys {
  static const isLoggedIn = 'isLoggedIn';
  static const accessToken = 'accessToken';
}
