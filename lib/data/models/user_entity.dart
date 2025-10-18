import 'package:hive_flutter/adapters.dart';
import 'package:register_app/constants/hive_constants.dart';
import 'package:register_app/data/models/address_entity.dart';
import 'package:register_app/domain/entities/user_model.dart';

part 'user_entity.g.dart';

@HiveType(typeId: kUserEntityTypeId)
class UserEntity {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? lastname;
  @HiveField(3)
  DateTime? birthDate;
  @HiveField(4)
  List<AddressEntity>? addresses;

  UserEntity({
    this.userId,
    this.name,
    this.lastname,
    this.birthDate,
    this.addresses
  });

  factory UserEntity.fromModel({
    required UserModel userModel
  }){
    return UserEntity(
        userId: userModel.userId,
        name: userModel.name,
        lastname: userModel.lastname,
        birthDate: userModel.birthDate,
        addresses: userModel.addresses?.map((model) => AddressEntity.fromModel(address: model)).toList()
    );
  }
}