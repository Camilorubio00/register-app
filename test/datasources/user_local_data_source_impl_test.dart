import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:register_app/data/datasources/user_local_data_source_impl.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/domain/entities/user_model.dart';

import 'user_local_data_source_impl_test.mocks.dart';

@GenerateMocks([Box])
void main() {
  late MockBox<UserEntity> mockBox;
  late UserLocalDataSourceImpl dataSource;

  setUp(() {
    mockBox = MockBox<UserEntity>();
    dataSource = UserLocalDataSourceImpl(box: mockBox);
  });

  group('saveUser', () {
    test('Save user when saveUser is called', () async {
      final userModel = UserModel(
        name: 'Juan',
        lastname: 'Pérez',
        birthDate: DateTime(1990, 1, 1),
      );
      when(mockBox.add(any)).thenAnswer((_) async => 0);

      await dataSource.saveUser(userModel: userModel);

      verify(mockBox.add(any)).called(1);
    });

    test('Launch Exception when exists error', () async {
      final userModel = UserModel(name: 'Juan', lastname: 'Pérez', birthDate: DateTime.now());

      when(mockBox.add(any)).thenThrow(Exception('Error Hive'));

      expect(() => dataSource.saveUser(userModel: userModel), throwsException);
    });
  });

  group('fetchUsers', () {
    test('Return user list when fetchUsers is called', () async {
      final userEntities = [
        UserEntity(name: 'Carlos', lastname: 'Gómez', birthDate: DateTime(1985, 2, 2)),
        UserEntity(name: 'Lucía', lastname: 'Ruiz', birthDate: DateTime(1990, 6, 6)),
      ];
      when(mockBox.values).thenReturn(userEntities);

      final result = await dataSource.fetchUsers();

      expect(result.isRight(), true);
      result.fold((value) => null, (users) {
        expect(users.length, 2);
        expect(users.first.name, 'Carlos');
      });
    });

    test('Return Left when is a Error', () async {
      when(mockBox.values).thenThrow(Exception('Error Hive'));

      final result = await dataSource.fetchUsers();

      expect(result.isLeft(), true);
    });
  });
}