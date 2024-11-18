import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/constants/storage_keys.dart';
import 'package:kindred_mobile/common/theme/theme_data.dart';
import 'package:kindred_mobile/common/translations/generated/l10n.dart';
import 'package:kindred_mobile/core/dependency_injection.dart';
import 'package:kindred_mobile/core/infrastructure/storage/shared_prefs_service.dart';

class App extends StatefulWidget {
  final GoRouter router;
  const App({super.key, required this.router});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final SharedPrefsService _prefs = DependencyInjection.instance<SharedPrefsService>();
  @override
  void initState() {
    super.initState();
    initLocale();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initLocale() async {
    final currentLocale = await _prefs.getVal(StorageKeys.seletedLanguage);
    await Lang.load(Locale(currentLocale.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme(),
      routerConfig: widget.router,
      localizationsDelegates: const [Lang.delegate],
      debugShowCheckedModeBanner: false,
    );
  }
}
