
import 'package:dartz/dartz.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class SaveLastnameUseCase {

  final UserRepository userRepository;

  SaveLastnameUseCase({ required this.userRepository });

  Future<Either<String, void>> call({ required String lastname }) async {
      return await userRepository.saveLastname(lastname: lastname);
  }

}