import 'package:dartz/dartz.dart';
import 'package:register_app/domain/entities/user_model.dart';

abstract class UserRepository {
  Future<void> saveUser({ required UserModel userModel });
  Future<Either<String, UserModel>> fetchUser();
}