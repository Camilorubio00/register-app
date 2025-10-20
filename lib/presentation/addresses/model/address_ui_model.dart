import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/domain/entities/address_model.dart';

class AddressUiModel {
  String description;
  String country;
  String state;
  String city;

  AddressUiModel({
    required this.description,
    required this.country,
    required this.state,
    required this.city
  });

  factory AddressUiModel.fromModel({ required AddressModel addressModel }){
    return AddressUiModel(
        description: addressModel.description ?? kEmptyString,
        country: addressModel.country ?? kEmptyString,
        state: addressModel.state ?? kEmptyString,
        city: addressModel.city ?? kEmptyString
    );
  }
}