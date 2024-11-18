import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kindred_mobile/core/dependency_injection.dart';
import 'package:kindred_mobile/core/presentation/navigation/root_go_router.dart';
import 'package:kindred_mobile/features/app/presentation/views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.registerDependencies();

  runApp(App(
    router: RootGoRouter.goRouter,
  ));
}
