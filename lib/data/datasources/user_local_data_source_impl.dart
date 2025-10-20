import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/domain/entities/user_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {

  final Box<UserEntity> box;

  UserLocalDataSourceImpl({ required this.box });
  
  @override
  Future<void> saveUser({required UserModel userModel}) async {
    try {
      final UserEntity userEntity = UserEntity.fromModel(userModel: userModel);
      await box.add(userEntity);
    } catch (e) {
      throw Exception('Error al guardar usuario: $e');
    }
  }

  @override
  Future<Either<String, List<UserModel>>> fetchUsers() async {
    try {
      final userEntityList = box.values.toList();
      final userModelList = userEntityList.map((model) => UserModel.fromEntity(userEntity: model)).toList();
      return Right(userModelList);
    } catch (exception) {
      return Left('Error al obtener usuario: ${exception.toString()}');
    }
  }

}