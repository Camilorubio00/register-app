import 'package:register_app/domain/repositories/location_repository.dart';

class GetCitiesUseCase {
  final LocationRepository locationRepository;

  GetCitiesUseCase({required this.locationRepository});

  Future<List<String>> call(String department) async {
    return await locationRepository.getCities(department);
  }
}