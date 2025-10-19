abstract class AddressesEvent {
  const AddressesEvent();
}

class ChangeAddress extends AddressesEvent {
  final String? address;
  final String? stateCountry;
  final String? country;
  final String? city;

  const ChangeAddress({this.address, this.stateCountry, this.country, this.city});
}

class AddTemporaryAddress extends AddressesEvent {}

class FetchTemporaryAddresses extends AddressesEvent {}

class SaveAddresses extends AddressesEvent {}

class ResetAddresses extends AddressesEvent {}