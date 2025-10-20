import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/entities/address_model.dart';
import 'package:register_app/domain/usecases/get_countries_use_case.dart';
import 'package:register_app/domain/usecases/get_departments_use_case.dart';
import 'package:register_app/domain/usecases/get_cities_use_case.dart';
import 'package:register_app/domain/usecases/save_user_use_case.dart';
import 'package:register_app/presentation/addresses/model/address_ui_model.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_event.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_state.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  final SaveUserUseCase _saveUserUseCase;
  final GetCountriesUseCase _getCountriesUseCase;
  final GetDepartmentsUseCase _getDepartmentsUseCase;
  final GetCitiesUseCase _getCitiesUseCase;
  String? _name;
  String? _lastname;
  DateTime? _birthdate;

  List<String> _countries = [];
  List<String> _departments = [];
  List<String> _cities = [];
  String? _country;
  String? _department;
  String? _city;
  String? _address;

  List<AddressModel> _addresses = [];

  UserRegistrationBloc({
    SaveUserUseCase? saveUserUseCase,
    GetCountriesUseCase? getCountriesUseCase,
    GetDepartmentsUseCase? getDepartmentsUseCase,
    GetCitiesUseCase? getCitiesUseCase,
  }) : _saveUserUseCase = saveUserUseCase ?? locator<SaveUserUseCase>(),
       _getCountriesUseCase =
           getCountriesUseCase ?? locator<GetCountriesUseCase>(),
       _getDepartmentsUseCase =
           getDepartmentsUseCase ?? locator<GetDepartmentsUseCase>(),
       _getCitiesUseCase =
           getCitiesUseCase ?? locator<GetCitiesUseCase>(),
       super(UserRegistrationInitial()) {
    on<FetchAddresses>(_onFetchAddresses);
    on<LoadCountries>(_onLoadCountries);
    on<SaveName>(_onSaveName);
    on<SaveLastname>(_onSaveLastname);
    on<SaveBirthday>(_onSaveBirthday);
    on<SaveAddress>(_onSaveAddress);
    on<SaveUser>(_onSaveUser);
    on<ChangeCountry>(_onChangeCountry);
    on<ChangeDepartment>(_onChangeDepartment);
    on<ChangeCity>(_onChangeCity);
    on<ChangeAddress>(_onChangeAddress);
    on<Cancel>(_onCancel);
    on<ResetAll>(_onResetAll);
  }

  void _onFetchAddresses(
    FetchAddresses event,
    Emitter<UserRegistrationState> emit,
  ) {
    final addressUiModelList = _addresses.map((model) => AddressUiModel.fromModel(addressModel: model)).toList();
    emit(AddressesLoaded(addressUiModelList));
  }

  void _onLoadCountries(
    LoadCountries event,
    Emitter<UserRegistrationState> emit,
  ) {
    final result = _getCountriesUseCase.call();
    _countries = result;
    emit(
      AddressFormState(
        countries: result,
        selectedCountry: _country,
        selectedDepartment: _department,
        selectedCity: _city,
        departments: _departments,
        cities: _cities,
        streetAddress: _address,
      ),
    );
  }

  void _onSaveName(SaveName event, Emitter<UserRegistrationState> emit) {
    _name = event.name;
    emit(ParamChanged());
  }

  void _onSaveLastname(
    SaveLastname event,
    Emitter<UserRegistrationState> emit,
  ) {
    _lastname = event.lastName;
    emit(ParamChanged());
  }

  void _onSaveBirthday(
    SaveBirthday event,
    Emitter<UserRegistrationState> emit,
  ) {
    _birthdate = event.birthday;
    emit(ParamChanged());
  }

  void _onSaveAddress(SaveAddress event, Emitter<UserRegistrationState> emit) {
    final isValid = _errorValidations(emit);
    if (!isValid) return;

    final addressModel = AddressModel(
      country: _country,
      state: _department,
      city: _city,
      description: _address,
    );
    _addresses = List.from(_addresses)..add(addressModel);
    _resetAddress();
    emit(AddressSaved());
  }

  bool _errorValidations(Emitter<UserRegistrationState> emit) {
    final validations = [
      [_country, 'Agregue país'],
      [_department, 'Agregue departamento'],
      [_city, 'Agregue ciudad'],
      [_address, 'Agregue dirección'],
    ];

    for (final [value, errorMessage] in validations) {
      if (value == null || value.isEmpty) {
        emit(UserRegistrationError(
          message: errorMessage ?? kEmptyString,
          countries: _countries,
          selectedCountry: _country,
          departments: _departments,
          selectedDepartment: _department,
          cities: _cities,
          selectedCity: _city,
          streetAddress: _address,
        ));
        return false;
      }
    }
    return true;
  }

  void _onSaveUser(SaveUser event, Emitter<UserRegistrationState> emit) async {
    final result = await _saveUserUseCase.call(
      name: _name,
      lastname: _lastname,
      birthDate: _birthdate,
      addresses: _addresses,
    );
    result.fold(
      (error) {
        emit(UserRegistrationError(
          message: error,
          countries: _countries,
          selectedCountry: _country,
          departments: _departments,
          selectedDepartment: _department,
          cities: _cities,
          selectedCity: _city,
          streetAddress: _address,
        ));
      },
      (value) => emit(UserRegistrationSuccess()),
    );
  }

  void _onChangeCountry(
    ChangeCountry event,
    Emitter<UserRegistrationState> emit,
  ) {
    _country = event.country;
    _cities.clear();
    final result = _getDepartmentsUseCase.call(event.country);
    _departments = result;
    emit(
      AddressFormState(
        countries: _countries,
        selectedCountry: _country,
        selectedDepartment: null,
        selectedCity: null,
        departments: result,
        cities: _cities,
        streetAddress: _address,
      ),
    );
  }

  void _onChangeDepartment(
    ChangeDepartment event,
    Emitter<UserRegistrationState> emit,
  ) {
    _department = event.department;
    final result = _getCitiesUseCase.call(event.department);
    _cities = result;
    emit(
      AddressFormState(
        countries: _countries,
        selectedCountry: _country,
        selectedDepartment: _department,
        selectedCity: null,
        departments: _departments,
        cities: _cities,
        streetAddress: _address,
      ),
    );
  }

  void _onChangeCity(
    ChangeCity event,
    Emitter<UserRegistrationState> emit,
  ) {
    _city = event.city;
    emit(
      AddressFormState(
        countries: _countries,
        selectedCountry: _country,
        selectedDepartment: _department,
        selectedCity: _city,
        departments: _departments,
        cities: _cities,
        streetAddress: _address,
      ),
    );
  }

  void _onChangeAddress(
    ChangeAddress event,
    Emitter<UserRegistrationState> emit,
  ) {
    _address = event.address ?? _address;
    emit(
      AddressFormState(
        countries: _countries,
        selectedCountry: _country,
        selectedDepartment: _department,
        selectedCity: _city,
        departments: _departments,
        cities: _cities,
        streetAddress: _address,
      ),
    );
  }

  void _resetAddress() {
    _country = null;
    _department = null;
    _city = null;
    _address = null;
  }

  void _resetUserInformation() {
    _name = null;
    _lastname = null;
    _birthdate = null;
  }

  void _onCancel(Cancel event, Emitter<UserRegistrationState> emit) {
    _resetAddress();
    _departments.clear();
    _cities.clear();
  }

  void _onResetAll(ResetAll event, Emitter<UserRegistrationState> emit) {
    _resetAddress();
    _resetUserInformation();
    _addresses.clear();
    _departments.clear();
    _cities.clear();
  }
}
