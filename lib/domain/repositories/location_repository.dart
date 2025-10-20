
abstract class LocationRepository {
  Future<List<String>> getCountries();
  Future<List<String>> getDepartments(String country);
  Future<List<String>> getCities(String department);
}