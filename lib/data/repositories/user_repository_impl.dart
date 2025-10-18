
import 'package:dartz/dartz.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({ required this.userLocalDataSource });

  @override
  Future<Either<String, void>> saveName({ required String name }) async {
    return await userLocalDataSource.saveName(name: name);
  }
  
  @override
  Future<Either<String, void>> fetchUser() {
    return Future.value(Right(null));
  }
  
  @override
  Future<Either<String, void>> saveLastname({required String lastname}) {
    return Future.value(Right(null));
  }

}