import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:register_app/data/datasources/location_remote_data_soruce_impl.dart';
import 'package:register_app/data/datasources/location_remote_data_source.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/datasources/user_local_data_source_impl.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/data/repositories/location_repository_impl.dart';
import 'package:register_app/data/repositories/user_repository_impl.dart';
import 'package:register_app/domain/repositories/location_repository.dart';
import 'package:register_app/domain/repositories/user_repository.dart';
import 'package:register_app/domain/usecases/fetch_users_use_case.dart';
import 'package:register_app/domain/usecases/get_countries_use_case.dart';
import 'package:register_app/domain/usecases/get_departments_use_case.dart';
import 'package:register_app/domain/usecases/get_municipalities_use_case.dart';
import 'package:register_app/domain/usecases/save_user_use_case.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_bloc.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpLocator({required Box<UserEntity> box}) async {
  // Datasources
  locator.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(box: box),
  );
  locator.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(),
  );

  // Repositories
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userLocalDataSource: locator<UserLocalDataSource>()),
  );
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationRemoteDataSource: locator<LocationRemoteDataSource>(),
    ),
  );

  // UseCases
  locator.registerLazySingleton<FetchUsersUseCase>(
    () => FetchUsersUseCase(userRepository: locator<UserRepository>()),
  );
  locator.registerLazySingleton<SaveUserUseCase>(
    () => SaveUserUseCase(userRepository: locator<UserRepository>()),
  );
  locator.registerLazySingleton<GetCountriesUseCase>(
        () => GetCountriesUseCase(locationRepository: locator<LocationRepository>()),
  );
  locator.registerLazySingleton<GetDepartmentsUseCase>(
        () => GetDepartmentsUseCase(locationRepository: locator<LocationRepository>()),
  );
  locator.registerLazySingleton<GetMunicipalitiesUseCase>(
        () => GetMunicipalitiesUseCase(locationRepository: locator<LocationRepository>()),
  );

  // Bloc
  locator.registerLazySingleton<UserRegistrationBloc>(
    () => UserRegistrationBloc(),
  );
  locator.registerFactory<WelcomeBloc>(() => WelcomeBloc());
}
