import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/entities/address_model.dart';
import 'package:register_app/domain/usecases/save_user_use_case.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_event.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_state.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  final SaveUserUseCase _saveUserUseCase;
  String? _name;
  String? _lastname;
  DateTime? _birthdate;

  String? _country;
  String? _stateCountry;
  String? _city;
  String? _address;

  List<AddressModel> _addresses = [];

  UserRegistrationBloc({SaveUserUseCase? saveUserUseCase})
    : _saveUserUseCase = saveUserUseCase ?? locator<SaveUserUseCase>(),
      super(UserRegistrationInitial()) {
    on<FetchAddresses>(_onFetchAddresses);
    on<SaveName>(_onSaveName);
    on<SaveLastname>(_onSaveLastname);
    on<SaveBirthday>(_onSaveBirthday);
    on<SaveAddress>(_onSaveAddress);
    on<SaveUser>(_onSaveUser);
    on<ChangeAddress>(_onChangeAddress);
    on<ResetAll>(_onResetAll);
  }

  void _onFetchAddresses(
    FetchAddresses event,
    Emitter<UserRegistrationState> emit,
  ) {
    emit(AddressesLoaded(_addresses));
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
    final addressModel = AddressModel(
      country: _country,
      state: _stateCountry,
      city: _city,
      description: _address,
    );
    _addresses = List.from(_addresses)..add(addressModel);
    _resetAddress();
    emit(AddressSaved());
  }

  void _onSaveUser(SaveUser event, Emitter<UserRegistrationState> emit) async {
    final result = await _saveUserUseCase.call(
      name: _name,
      lastname: _lastname,
      birthDate: _birthdate,
      addresses: _addresses,
    );
    result.fold(
      (error) => emit(UserRegistrationError(error)),
      (value) => emit(UserRegistrationSuccess()),
    );
  }

  void _onChangeAddress(
    ChangeAddress event,
    Emitter<UserRegistrationState> emit,
  ) {
    _country = event.country ?? _country;
    _stateCountry = event.stateCountry ?? _stateCountry;
    _city = event.city ?? _city;
    _address = event.address ?? _address;
    emit(ParamChanged());
  }

  void _resetAddress() {
    _country = null;
    _stateCountry = null;
    _city = null;
    _address = null;
  }

  void _resetUserInformation() {
    _name = null;
    _lastname = null;
    _birthdate = null;
  }

  void _onResetAll(ResetAll event, Emitter<UserRegistrationState> emit) {
    _resetAddress();
    _resetUserInformation();
    _addresses.clear();
  }
}
