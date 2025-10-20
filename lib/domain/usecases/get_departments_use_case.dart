import 'package:register_app/domain/repositories/location_repository.dart';

class GetDepartmentsUseCase {
  final LocationRepository locationRepository;

  GetDepartmentsUseCase({required this.locationRepository});

  List<String> call(String country) {
    return locationRepository.getDepartments(country);
  }
}