import 'package:flutter/material.dart';
import 'package:register_app/presentation/config/router/router.dart';
import 'package:register_app/core/injection_service.dart' as di;

void main() async {
  await di.setUpLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, 
      title: 'Mi App',
    );
  }
}
