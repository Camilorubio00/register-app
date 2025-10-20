import 'package:register_app/domain/repositories/location_repository.dart';

class GetCountriesUseCase {
  final LocationRepository locationRepository;

  GetCountriesUseCase({required this.locationRepository});

  List<String> call()  {
    return locationRepository.getCountries();
  }
}