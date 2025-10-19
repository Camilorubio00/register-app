import 'package:dartz/dartz.dart';
import 'package:register_app/domain/entities/address_model.dart';
import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class SaveUserUseCase {
  final UserRepository userRepository;

  SaveUserUseCase({required this.userRepository});

  Future<Either<String, void>> call({
    String? name,
    String? lastname,
    DateTime? birthDate,
    List<AddressModel>? addresses,
  }) async {
    final userModel = UserModel(
        name: name,
        lastname: lastname,
        birthDate: birthDate,
        addresses: addresses
    );
    final result = await userRepository.saveUser(userModel: userModel);
    return Right(result);
  }
}