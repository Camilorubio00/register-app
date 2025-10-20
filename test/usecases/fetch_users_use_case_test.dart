import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:register_app/domain/entities/user_model.dart';
import 'package:register_app/domain/repositories/user_repository.dart';
import 'package:register_app/domain/usecases/fetch_users_use_case.dart';

import 'fetch_users_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late FetchUsersUseCase fetchUsersUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    fetchUsersUseCase = FetchUsersUseCase(userRepository: mockUserRepository);
  });

  test('Return user list when called is Success', () async {
    final users = [
      UserModel(name: 'Camila', lastname: 'Ruiz', birthDate: DateTime(1990, 1, 1)),
      UserModel(name: 'Carlos', lastname: 'Gómez', birthDate: DateTime(1985, 5, 5)),
    ];

    when(mockUserRepository.fetchUsers()).thenAnswer((_) async => Right(users));

    final result = await fetchUsersUseCase();

    expect(result.isRight(), true);
    result.fold(
          (_) => null,
          (userList) {
        expect(userList.length, 2);
        expect(userList.first.name, 'Camila');
      },
    );
    verify(mockUserRepository.fetchUsers()).called(1);
  });

  test('Return error when call fetchUsersUseCase', () async {
    final errorMessage = 'Error al obtener usuarios';
    when(mockUserRepository.fetchUsers())
        .thenAnswer((_) async => Left(errorMessage));

    final result = await fetchUsersUseCase();

    expect(result.isLeft(), true);
    result.fold(
          (error) => expect(error, errorMessage),
          (_) => null,
    );
    verify(mockUserRepository.fetchUsers()).called(1);
  });
}