import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/add_temporary_address_use_case.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/addresses/bloc/addresses_event.dart';
import 'package:register_app/presentation/addresses/bloc/addresses_state.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  final UpdateUserUseCase _updateUserUseCase;
  final AddTemporaryAddressUseCase _addTemporaryAddressUseCase;
  String country = kEmptyString;
  String stateCountry = kEmptyString;
  String city = kEmptyString;
  String address = kEmptyString;

  AddressesBloc({
    UpdateUserUseCase? updateUserUseCase,
    AddTemporaryAddressUseCase? addTemporaryAddressUseCase,
  })
      : _addTemporaryAddressUseCase =
      addTemporaryAddressUseCase ?? locator<AddTemporaryAddressUseCase>(),
        _updateUserUseCase = updateUserUseCase ?? locator<UpdateUserUseCase>(),
        super(AddressesInitial()) {
    on<AddTemporaryAddress>(_onAddTemporaryAddress);
    on<FetchTemporaryAddresses>(_onFetchTemporaryAddresses);
    on<SaveAddresses>(_onSaveAddresses);
    on<ChangeAddress>(_onChangeAddress);
  }

  void _onFetchTemporaryAddresses(FetchTemporaryAddresses event,
      Emitter<AddressesState> emit) async {
    final result = _addTemporaryAddressUseCase.getTemporaryAddress();
    emit(AddressSavedTemporary(result));
  }

  void _onAddTemporaryAddress(AddTemporaryAddress event,
      Emitter<AddressesState> emit) async {
    final result = await _addTemporaryAddressUseCase.call(
        country: country,
        stateCountry: stateCountry,
        city: city,
        address: address);

    final temporaryAddresses = _addTemporaryAddressUseCase.getTemporaryAddress();

    result.fold(
          (error) => emit(AddressesError(error)),
          (value) => emit(AddressSavedTemporary(temporaryAddresses)),
    );
  }

  Future<void> _onSaveAddresses(SaveAddresses event,
      Emitter<AddressesState> emit,) async {
    emit(AddressesLoading());
    final addresses = _addTemporaryAddressUseCase.getTemporaryAddress();
    await _updateUserUseCase.call(addresses: addresses);
    emit(AddressesSaved());
  }

  Future<void> _onChangeAddress(ChangeAddress event,
      Emitter<AddressesState> emit,) async {
    country = event.country ?? country;
    stateCountry = event.stateCountry ?? stateCountry;
    city = event.city ?? city;
    address = event.address ?? address;
    emit(AddressesChanged());
  }
}
