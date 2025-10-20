import 'package:register_app/domain/entities/address_model.dart';
import 'package:register_app/presentation/addresses/model/address_ui_model.dart';

abstract class UserRegistrationState {
  List<String> get countries => [];
  List<String> get departments => [];
  List<String> get cities => [];
  String? get selectedCountry => null;
  String? get selectedDepartment => null;
  String? get selectedCity => null;
  String? get streetAddress => null;
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {}

class UserRegistrationLoading extends UserRegistrationState {}

class ParamChanged extends UserRegistrationState {}

class AddressFormState extends UserRegistrationState {
  @override
  final List<String> countries;

  @override
  final List<String> departments;

  @override
  final List<String> cities;

  @override
  final String? selectedCountry;

  @override
  final String? selectedDepartment;

  @override
  final String? selectedCity;

  @override
  final String? streetAddress;

  final String? userName;
  final String? userLastname;
  final DateTime? userBirthdate;
  final List<AddressModel> currentAddresses;

  const AddressFormState({
    this.countries = const [],
    this.departments = const [],
    this.cities = const [],
    this.selectedCountry,
    this.selectedDepartment,
    this.selectedCity,
    this.streetAddress,
    this.userName,
    this.userLastname,
    this.userBirthdate,
    this.currentAddresses = const [],
  });

  bool get canSaveAddress =>
      selectedCountry != null &&
          selectedDepartment != null &&
          selectedCity != null;

  AddressFormState copyWith({
    List<String>? countries,
    List<String>? departments,
    List<String>? cities,
    String? selectedCountry,
    String? selectedDepartment,
    String? selectedCity,
    String? streetAddress,
    String? userName,
    String? userLastname,
    DateTime? userBirthdate,
    List<AddressModel>? currentAddresses,
  }) {
    return AddressFormState(
      countries: countries ?? this.countries,
      departments: departments ?? this.departments,
      cities: cities ?? this.cities,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedDepartment: selectedDepartment ?? this.selectedDepartment,
      selectedCity: selectedCity ?? this.selectedCity,
      streetAddress: streetAddress ?? this.streetAddress,
      userName: userName ?? this.userName,
      userLastname: userLastname ?? this.userLastname,
      userBirthdate: userBirthdate ?? this.userBirthdate,
      currentAddresses: currentAddresses ?? this.currentAddresses,
    );
  }
}

class AddressSaved extends UserRegistrationState {}

class AddressesLoaded extends UserRegistrationState {
  final List<AddressUiModel> addresses;
  const AddressesLoaded(this.addresses);
}

class UserRegistrationSuccess extends UserRegistrationState {}

class UserRegistrationError extends AddressFormState {
  final String message;

  UserRegistrationError({
    required this.message,
    required List<String> countries,
    String? selectedCountry,
    List<String> departments = const [],
    String? selectedDepartment,
    List<String> cities = const [],
    String? selectedCity,
    String? streetAddress,
  }) : super(
    countries: countries,
    selectedCountry: selectedCountry,
    departments: departments,
    selectedDepartment: selectedDepartment,
    cities: cities,
    selectedCity: selectedCity,
    streetAddress: streetAddress,
  );
}