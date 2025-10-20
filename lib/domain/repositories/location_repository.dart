
abstract class LocationRepository {
  List<String> getCountries();
  List<String> getDepartments(String country);
  List<String> getCities(String department);
}