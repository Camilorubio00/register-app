import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push(kLastnameScreen),
          child: Text('Ir a Apellido'),
        ),
      ),
    );
  }
}