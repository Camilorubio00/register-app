import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({required this.locationRemoteDataSource});

  @override
  List<String> getCountries() {
    return locationRemoteDataSource.getCountries();
  }

  @override
  List<String> getDepartments(String country) {
    return locationRemoteDataSource.getDepartments(country);
  }

  @override
  List<String> getMunicipalities(String department) {
    return locationRemoteDataSource.getMunicipalities(department);
  }
}