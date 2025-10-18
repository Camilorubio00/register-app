import 'package:go_router/go_router.dart';
import 'package:register_app/presentation/addresses/addresses_screen.dart';
import 'package:register_app/presentation/birthday/birthday_screen.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/lastname/lastname_screen.dart';
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
      builder: (context, state) => NameScreen(),
    ),
    GoRoute(
      path: kLastnameScreen,
      builder: (context, state) => LastnameScreen(),
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