import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push(kAddressesScreen),
          child: Text('Terminar Registro'),
        ),
      ),
    );
  }
}