import 'package:register_app/domain/repositories/location_repository.dart';

class GetDepartmentsUseCase {
  final LocationRepository locationRepository;

  GetDepartmentsUseCase({required this.locationRepository});

  Future<List<String>> call(String country) async {
    return await locationRepository.getDepartments(country);
  }
}