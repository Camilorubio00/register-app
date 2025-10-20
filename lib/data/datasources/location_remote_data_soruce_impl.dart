import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/data/location_data.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  LocationRemoteDataSourceImpl();

  @override
  List<String> getCountries() {
    return LocationData.countries;
  }

  @override
  List<String> getDepartments(String country) {
    final departments = LocationData.departments[country];
    return departments ?? [];
  }

  @override
  List<String> getCities(String department) {
    final cities = LocationData.cities[department];
    return cities ?? [];
  }
}