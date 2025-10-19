import 'package:dartz/dartz.dart';
import 'package:register_app/domain/entities/address_model.dart';

class AddTemporaryAddressUseCase {
  List<AddressModel> _temporaryAddresses = [];

  AddTemporaryAddressUseCase();

  Future<Either<String, AddressModel>> call({
    required String country,
    required String stateCountry,
    required String city,
    required String address
  }) async {

    /*if(country.isEmpty) {
      return Left("Elige un país");
    } else if(stateCountry.isEmpty) {
      return Left("Elige un departamento");
    } else if(city.isEmpty) {
      return Left("Elige un ciudad");
    } else if(address.isEmpty) {
      return Left("Digita una direccion");
    }*/

    final addressModel = AddressModel(
      country: country,
      state: stateCountry,
      city: city,
      description: address
    );

    _temporaryAddresses = List.from(_temporaryAddresses)..add(addressModel);
    return Right(addressModel);
  }

  List<AddressModel> getTemporaryAddress() {
    return _temporaryAddresses;
  }

  void clearTemporaryAddresses() {
    _temporaryAddresses.clear();
  }
}