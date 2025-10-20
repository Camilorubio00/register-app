import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/data/repositories/location_repository_impl.dart';

import 'location_repository_impl_test.mocks.dart';

@GenerateMocks([LocationRemoteDataSource])
void main() {
  late MockLocationRemoteDataSource mockRemoteDataSource;
  late LocationRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockLocationRemoteDataSource();
    repository = LocationRepositoryImpl(locationRemoteDataSource: mockRemoteDataSource);
  });

  test('getCountries from dataSource', () async {
    final countries = ['Colombia', 'Argentina'];
    when(mockRemoteDataSource.getCountries()).thenAnswer((_) async => countries);

    final result = await repository.getCountries();

    expect(result, countries);
    verify(mockRemoteDataSource.getCountries()).called(1);
  });

  test('getDepartments from dataSource', () async {
    final departments = ['Antioquia', 'Cundinamarca'];
    const country = 'Colombia';
    when(mockRemoteDataSource.getDepartments(country)).thenAnswer((_) async => departments);

    final result = await repository.getDepartments(country);

    expect(result, departments);
    verify(mockRemoteDataSource.getDepartments(country)).called(1);
  });

  test('getCities from dataSource', () async {
    final cities = ['Medellín', 'Envigado'];
    const department = 'Antioquia';
    when(mockRemoteDataSource.getCities(department)).thenAnswer((_) async => cities);

    final result = await repository.getCities(department);

    expect(result, cities);
    verify(mockRemoteDataSource.getCities(department)).called(1);
  });
}