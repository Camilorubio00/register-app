import 'package:register_app/presentation/welcome/model/user_ui_model.dart';

abstract class WelcomeState {
  const WelcomeState();
}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class UsersLoaded extends WelcomeState {
  final List<UserUiModel> users;

  const UsersLoaded(this.users);
}

class WelcomeError extends WelcomeState {
  final String message;

  const WelcomeError(this.message);
}