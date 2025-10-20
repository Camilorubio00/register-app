
abstract class LocationRepository {
  List<String> getCountries();
  List<String> getDepartments(String country);
  List<String> getMunicipalities(String department);
}