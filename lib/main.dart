import 'package:flutter/material.dart';
import 'package:register_app/presentation/config/router/router.dart';

void main() {
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
