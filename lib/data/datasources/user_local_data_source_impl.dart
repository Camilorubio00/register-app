import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:register_app/constants/hive_constants.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/domain/entities/user_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {

  final HiveInterface _hive;

  UserLocalDataSourceImpl({ HiveInterface? hive }) : _hive = hive ?? Hive;
  
  @override
  Future<void> saveUser({required UserModel userModel}) async {
    final Box<UserEntity> userBox = _hive.box(kHiveUserBox);
    await userBox.clear();
    final UserEntity userEntity = UserEntity.fromModel(userModel: userModel);
    await userBox.add(userEntity);
  }

  @override
  Future<Either<String, UserModel>> fetchUser() async {
    try {
      final Box<UserEntity> userBox = _hive.box(kHiveUserBox);
      final userEntity = userBox.get(0);
      if(userEntity != null) {
        final user = UserModel.fromEntity(userEntity: userEntity);
        return Right(user);
      }
      return Right(UserModel());
    } catch (exception) {
      return Left('Error al obtener usuario: ${exception.toString()}');
    }
  }
  
}