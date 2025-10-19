abstract class UserRegistrationEvent {
  const UserRegistrationEvent();
}

class FetchAddresses extends UserRegistrationEvent {}

class SaveName extends UserRegistrationEvent {
  final String name;

  const SaveName(this.name);
}

class SaveLastname extends UserRegistrationEvent {
  final String lastName;

  const SaveLastname(this.lastName);
}

class ChangeAddress extends UserRegistrationEvent {
  final String? address;
  final String? stateCountry;
  final String? country;
  final String? city;

  const ChangeAddress({this.address, this.stateCountry, this.country, this.city});
}

class SaveBirthday extends UserRegistrationEvent {
  final DateTime birthday;

  const SaveBirthday(this.birthday);
}

class SaveAddress extends UserRegistrationEvent {}

class SaveUser extends UserRegistrationEvent {}

class ResetAll extends UserRegistrationEvent {}