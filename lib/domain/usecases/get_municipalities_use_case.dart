import 'package:register_app/domain/repositories/location_repository.dart';

class GetMunicipalitiesUseCase {
  final LocationRepository locationRepository;

  GetMunicipalitiesUseCase({required this.locationRepository});

  List<String> call(String department) {
    return locationRepository.getMunicipalities(department);
  }
}