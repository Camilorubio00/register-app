import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/domain/entities/address_model.dart';

class UserModel {
  String? userId;
  String? name;
  String? lastname;
  DateTime? birthDate;
  List<AddressModel>? addresses;

  UserModel({
    this.userId,
    this.name,
    this.lastname,
    this.birthDate,
    this.addresses
  });

  factory UserModel.fromEntity({ required UserEntity userEntity }){
    return UserModel(
        userId: userEntity.userId,
        name: userEntity.name,
        lastname: userEntity.lastname,
        birthDate: userEntity.birthDate,
        addresses: userEntity.addresses?.map((model) => AddressModel.fromEntity(addressEntity: model)).toList()
    );
  }

  UserModel copyWith({
    String? name,
    String? lastname,
    DateTime? birthDate
  }) {
    return UserModel(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      birthDate: birthDate ?? this.birthDate
    );
  }
}