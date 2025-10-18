import 'package:hive_flutter/adapters.dart';
import 'package:register_app/constants/hive_constants.dart';
import 'package:register_app/domain/entities/address_model.dart';

part 'address_entity.g.dart';

@HiveType(typeId: kAddressEntityTypeId) 
class AddressEntity {
  @HiveField(0)
  final String? description;
  @HiveField(1)
  final String? country;
  @HiveField(2)
  final String? state;
  @HiveField(3)
  final String? city;

  const AddressEntity({
    this.description,
    this.country,
    this.state,
    this.city
  });

  factory AddressEntity.fromModel({
    required AddressModel address
  }){
    return AddressEntity(
        description: address.description,
        country: address.country,
        state: address.state,
        city: address.city
    );
  }
}