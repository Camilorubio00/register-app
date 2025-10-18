import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;

  UpdateUserUseCase({required this.userRepository});

  Future<void> call({
    String? name,
    String? lastname,
    DateTime? birthDate,
  }) async {
    final currentUserResult = await userRepository.fetchUser();
    return await currentUserResult.fold(
      (error) async {
        final newUser = UserModel(
          name: name,
          lastname: lastname,
          birthDate: birthDate,
          addresses: List.empty(),
        );
        return await userRepository.saveUser(userModel: newUser);
      },
      (currentUser) async {
        final updatedUser = currentUser.copyWith(
          name: name,
          lastname: lastname,
          birthDate: birthDate,
        );
        return await userRepository.saveUser(userModel: updatedUser);
      },
    );
  }
}
