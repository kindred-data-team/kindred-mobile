import 'package:flutter/material.dart';
import 'package:kindred_app/core/presentation/navigation/app_router.dart';
import 'package:kindred_app/features/app/presentation/views/app.dart';

Future<void> main() async {
  // await Session().init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(
    router: AppRouter.goRouter,
  ));
}
