import 'package:register_app/data/models/address_entity.dart';

class AddressModel {
  String? description;
  String? country;
  String? state;
  String? city;

  AddressModel({
    this.description,
    this.country,
    this.state,
    this.city
  });

  factory AddressModel.fromEntity({ required AddressEntity addressEntity }){
    return AddressModel(
        description: addressEntity.description,
        country: addressEntity.country,
        state: addressEntity.state,
        city: addressEntity.city
    );
  }
}