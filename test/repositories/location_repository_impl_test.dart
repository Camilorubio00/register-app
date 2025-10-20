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

  test('getCountries from dataSource', () {
    final countries = ['Colombia', 'Argentina'];
    when(mockRemoteDataSource.getCountries()).thenReturn(countries);

    final result = repository.getCountries();

    expect(result, countries);
    verify(mockRemoteDataSource.getCountries()).called(1);
  });

  test('getDepartments from dataSource', () {
    final departments = ['Antioquia', 'Cundinamarca'];
    const country = 'Colombia';
    when(mockRemoteDataSource.getDepartments(country)).thenReturn(departments);

    final result = repository.getDepartments(country);

    expect(result, departments);
    verify(mockRemoteDataSource.getDepartments(country)).called(1);
  });

  test('getCities from dataSource', () {
    final cities = ['Medellín', 'Envigado'];
    const department = 'Antioquia';
    when(mockRemoteDataSource.getCities(department)).thenReturn(cities);

    final result = repository.getCities(department);

    expect(result, cities);
    verify(mockRemoteDataSource.getCities(department)).called(1);
  });
}