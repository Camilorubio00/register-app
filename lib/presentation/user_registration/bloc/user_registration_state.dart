import 'package:register_app/domain/entities/address_model.dart';

abstract class UserRegistrationState {
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {}

class UserRegistrationLoading extends UserRegistrationState {}

class ParamChanged extends UserRegistrationState {}

class AddressSaved extends UserRegistrationState {}

class AddressesLoaded extends UserRegistrationState {
  final List<AddressModel> addresses;
  const AddressesLoaded(this.addresses);
}

class UserRegistrationSuccess extends UserRegistrationState {}

class UserRegistrationError extends UserRegistrationState {
  final String message;

  const UserRegistrationError(this.message);
}