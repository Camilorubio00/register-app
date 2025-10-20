import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/presentation/addresses/add_address_screen.dart';
import 'package:register_app/presentation/addresses/addresses_screen.dart';
import 'package:register_app/presentation/birthday/birthday_screen.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/lastname/lastname_screen.dart';
import 'package:register_app/presentation/name/name_screen.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_bloc.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:register_app/presentation/welcome/welcome_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final router = GoRouter(
  initialLocation: kWelcomeScreen,
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: kWelcomeScreen,
      builder: (context, state) => BlocProvider(
        create: (_) => locator<WelcomeBloc>(),
        child: const WelcomeScreen(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) => BlocProvider<UserRegistrationBloc>.value(
        value: locator<UserRegistrationBloc>(),
        child: child,
      ),
      routes: [
        GoRoute(
          path: kNameScreen,
          builder: (context, state) => const NameScreen()
        ),
        GoRoute(
          path: kLastnameScreen,
          builder: (context, state) => const LastnameScreen(),
        ),
        GoRoute(
          path: kBirthdayScreen,
          builder: (context, state) => const BirthdayScreen(),
        ),
        GoRoute(
          path: kAddressesScreen,
          builder: (context, state) => const AddressesScreen(),
          routes: [
            GoRoute(
              path: kAddAddressScreen,
              name: 'add',
              builder: (context, state) => const AddAddressScreen(),
            ),
          ],
        ),
      ],
    )
  ],
);
