import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:register_app/data/models/address_entity.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/presentation/config/router/router.dart';
import 'package:register_app/core/injection_service.dart' as di;
import 'constants/hive_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final box = await initializeHive();
  await di.setUpLocator(box: box);
  runApp(const MainApp());
}

Future<Box<UserEntity>> initializeHive() async {
  final Directory directory = await path_provider
      .getApplicationDocumentsDirectory();

  Hive
    ..init(directory.path)
    ..registerAdapter(UserEntityAdapter())
    ..registerAdapter(AddressEntityAdapter());

  return await Hive.openBox<UserEntity>(kHiveUserBox);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Mi App',
      theme: _getThemeData(),
    );
  }

  ThemeData _getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black87)),
    );
  }
}
