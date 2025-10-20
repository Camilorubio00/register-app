import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/presentation/addresses/model/address_ui_model.dart';

class UserUiModel {
  String name;
  String lastname;
  String birthDate;
  List<AddressUiModel>? addresses;

  UserUiModel({
    required this.name,
    required this.lastname,
    required this.birthDate,
    this.addresses
  });

  factory UserUiModel.fromModel({ required UserModel userModel }){
    return UserUiModel(
        name: userModel.name ?? kEmptyString,
        lastname: userModel.lastname ?? kEmptyString,
        birthDate: userModel.birthDate.toString(),
        addresses: userModel.addresses?.map((model) =>
            AddressUiModel.fromModel(addressModel: model)).toList()
    );
  }
}