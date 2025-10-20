import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({required this.locationRemoteDataSource});

  @override
  Future<List<String>> getCountries() async {
    return await locationRemoteDataSource.getCountries();
  }

  @override
  Future<List<String>> getDepartments(String country) async {
    return await locationRemoteDataSource.getDepartments(country);
  }

  @override
  Future<List<String>> getCities(String department) async {
    return await locationRemoteDataSource.getCities(department);
  }
}