import 'package:register_app/domain/repositories/location_repository.dart';

class GetCountriesUseCase {
  final LocationRepository locationRepository;

  GetCountriesUseCase({required this.locationRepository});

  Future<List<String>> call() async {
    return await locationRepository.getCountries();
  }
}