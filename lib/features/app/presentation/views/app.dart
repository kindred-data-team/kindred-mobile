import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/theme/theme_data.dart';

class App extends StatefulWidget {
  final GoRouter router;
  const App({super.key, required this.router});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme(),
      routerConfig: widget.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
