import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/presentation/addresses/addresses_screen.dart';
import 'package:register_app/presentation/birthday/birthday_screen.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_bloc.dart';
import 'package:register_app/presentation/lastname/lastname_screen.dart';
import 'package:register_app/presentation/name/bloc/name_bloc.dart';
import 'package:register_app/presentation/name/bloc/name_event.dart';
import 'package:register_app/presentation/name/name_screen.dart';
import 'package:register_app/presentation/welcome/welcome_screen.dart';

final router = GoRouter(
  initialLocation: kWelcomeScreen,
  routes: [
    
    GoRoute(
      path: kWelcomeScreen,
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
        path: kNameScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => locator<NameBloc>(),
          child: const NameScreen(),
        ),
    ),
    GoRoute(
        path: kLastnameScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => locator<LastnameBloc>(),
          child: const LastnameScreen(),
        ),
    ),
    GoRoute(
      path: kBirthdayScreen,
      builder: (context, state) => BirthdayScreen(),
    ),
    GoRoute(
      path: kAddressesScreen,
      builder: (context, state) => AddressesScreen(),
    ),
  ],
);