
abstract class LocationRemoteDataSource {
  List<String> getCountries();
  List<String> getDepartments(String country);
  List<String> getMunicipalities(String department);
}