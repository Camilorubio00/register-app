import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/data/location_data.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  LocationRemoteDataSourceImpl();

  @override
  Future<List<String>> getCountries() async{
    return LocationData.countries;
  }

  @override
  Future<List<String>> getDepartments(String country) async {
    final departments = LocationData.departments[country];
    return departments ?? [];
  }

  @override
  Future<List<String>> getCities(String department) async {
    final cities = LocationData.cities[department];
    return cities ?? [];
  }
}