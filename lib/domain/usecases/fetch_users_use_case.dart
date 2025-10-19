
import 'package:dartz/dartz.dart';
import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class FetchUsersUseCase {
  final UserRepository userRepository;

  FetchUsersUseCase({required this.userRepository});

  Future<Either<String, List<UserModel>>> call() async {
    return await userRepository.fetchUsers();
  }
}