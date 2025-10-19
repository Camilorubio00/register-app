import 'package:register_app/domain/entities/address_model.dart';

abstract class AddressesState {
  const AddressesState();
}

class AddressesInitial extends AddressesState {}

class AddressesLoading extends AddressesState {}

class AddressesChanged extends AddressesState {}

class AddressesCleared extends AddressesState {}

class AddressSavedTemporary extends AddressesState {
  final List<AddressModel> temporaryAddresses;
  const AddressSavedTemporary(this.temporaryAddresses);
}

class AddressesSaved extends AddressesState {}

class AddressesError extends AddressesState {
  final String message;

  const AddressesError(this.message);
}