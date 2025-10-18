import 'package:dartz/dartz.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class FetchUserUseCase {

  final UserRepository userRepository;

  FetchUserUseCase({ required this.userRepository });

  Future<Either<String, void>> call() async {
      return await userRepository.fetchUser();
  }

}