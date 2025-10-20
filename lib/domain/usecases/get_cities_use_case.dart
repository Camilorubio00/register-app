import 'package:register_app/domain/repositories/location_repository.dart';

class GetCitiesUseCase {
  final LocationRepository locationRepository;

  GetCitiesUseCase({required this.locationRepository});

  List<String> call(String department) {
    return locationRepository.getCities(department);
  }
}