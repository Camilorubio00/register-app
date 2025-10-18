import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<String, void>> saveName({ required String name });
  Future<Either<String, void>> saveLastname({ required String lastname });
  Future<Either<String, void>> fetchUser();
}