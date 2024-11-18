
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/common/constants/storage_keys.dart';
import 'package:kindred_mobile/common/translations/generated/l10n.dart';
import 'package:kindred_mobile/core/infrastructure/storage/keychain_service.dart';
import 'package:kindred_mobile/core/infrastructure/storage/shared_prefs_service.dart';
import 'package:equatable/equatable.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Cubit<AppState> {
  final KeychainService _keychainService;
  final SharedPrefsService _prefs;
  final List<Map<String, String>> _languages = [
    {
      "code": "kr",
      "language": "Korea",
    },
    {
      "code": "en",
      "language": "English",
    },
  ];

  AppBloc(
    this._keychainService,
    this._prefs,
  ) : super(AppInitial());

  Future<void> logout() async {
    await _keychainService.clearAll();
  }

  Future<void> getCurrentLang() async {
    String? langCode = await _prefs.getVal(StorageKeys.seletedLanguage) as String;
    String defaultLang = "en";
    defaultLang = langCode;
    emit(state.copyWith(currentLang: defaultLang));
  }

  void getLanguages() {
    emit(state.copyWith(languages: _languages));
  }

  Future<void> changeLang(String langCode) async {
    await Lang.load(Locale(langCode));
    await _prefs.setVal(StorageKeys.seletedLanguage, langCode);
    emit(state.copyWith(currentLang: langCode));
  }
}