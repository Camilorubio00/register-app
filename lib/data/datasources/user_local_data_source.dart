import 'package:dartz/dartz.dart';

abstract class UserLocalDataSource {
  Future<Either<String, void>> saveName({ required String name });
}