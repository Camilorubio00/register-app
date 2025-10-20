import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/repositories/user_repository_impl.dart';
import 'package:register_app/domain/entities/user_model.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserLocalDataSource])
void main() {
  late MockUserLocalDataSource mockDataSource;
  late UserRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockUserLocalDataSource();
    repository = UserRepositoryImpl(userLocalDataSource: mockDataSource);
  });

  test('saveUser after call function of dataSource', () async {
    final user = UserModel(name: 'Juan', lastname: 'Pérez', birthDate: DateTime(1990, 1, 1));
    when(mockDataSource.saveUser(userModel: user)).thenAnswer((_) async => Future.value());

    await repository.saveUser(userModel: user);

    verify(mockDataSource.saveUser(userModel: user)).called(1);
  });

  test('fetchUsers successfully and return user List', () async {
    final users = [
      UserModel(name: 'User1', lastname: 'Last1', birthDate: DateTime(1980, 3, 3)),
      UserModel(name: 'User2', lastname: 'Last2', birthDate: DateTime(1990, 4, 4)),
    ];
    when(mockDataSource.fetchUsers()).thenAnswer((_) async => Right(users));

    final result = await repository.fetchUsers();

    expect(result, Right(users));
    verify(mockDataSource.fetchUsers()).called(1);
  });
}