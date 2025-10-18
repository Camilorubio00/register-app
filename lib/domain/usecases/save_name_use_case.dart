import 'package:dartz/dartz.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class SaveNameUseCase {

  final UserRepository userRepository;

  SaveNameUseCase({ required this.userRepository });

  Future<Either<String, void>> saveName({ required String name }) async {
      return await userRepository.saveName(name: name);
  }

}