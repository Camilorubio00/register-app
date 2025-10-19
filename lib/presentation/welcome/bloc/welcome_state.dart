import 'package:register_app/domain/entities/user_model.dart';

abstract class WelcomeState {
  const WelcomeState();
}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class UsersLoaded extends WelcomeState {
  final List<UserModel> users;

  const UsersLoaded(this.users);
}

class WelcomeError extends WelcomeState {
  final String message;

  const WelcomeError(this.message);
}