
import 'package:dartz/dartz.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({ required this.userLocalDataSource });

  @override
  Future<void> saveUser({ required UserModel userModel }) async {
    return await userLocalDataSource.saveUser(userModel: userModel);
  }
  
  @override
  Future<Either<String, UserModel>> fetchUser() async {
    return await userLocalDataSource.fetchUser();
  }

}