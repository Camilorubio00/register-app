abstract class UserRegistrationEvent {
  const UserRegistrationEvent();
}

class FetchAddresses extends UserRegistrationEvent {}

class LoadCountries extends UserRegistrationEvent {}

class SaveName extends UserRegistrationEvent {
  final String name;

  const SaveName(this.name);
}

class SaveLastname extends UserRegistrationEvent {
  final String lastName;

  const SaveLastname(this.lastName);
}

class ChangeCountry extends UserRegistrationEvent {
  final String country;
  const ChangeCountry({ required this.country});
}

class ChangeDepartment extends UserRegistrationEvent {
  final String stateCountry;
  const ChangeDepartment({ required this.stateCountry});
}

class ChangeMunicipality extends UserRegistrationEvent {
  final String? city;
  const ChangeMunicipality({this.city});
}

class ChangeAddress extends UserRegistrationEvent {
  final String? address;
  const ChangeAddress({this.address});
}

class SaveBirthday extends UserRegistrationEvent {
  final DateTime birthday;

  const SaveBirthday(this.birthday);
}

class SaveAddress extends UserRegistrationEvent {}

class SaveUser extends UserRegistrationEvent {}

class Cancel extends UserRegistrationEvent {}

class ResetAll extends UserRegistrationEvent {}