import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/datasources/user_local_data_source_impl.dart';
import 'package:register_app/data/models/user_entity.dart';
import 'package:register_app/data/repositories/user_repository_impl.dart';
import 'package:register_app/domain/repositories/user_repository.dart';
import 'package:register_app/domain/usecases/add_temporary_address_use_case.dart';
import 'package:register_app/domain/usecases/fetch_users_use_case.dart';
import 'package:register_app/domain/usecases/save_user_use_case.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_bloc.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpLocator({ required Box<UserEntity> box }) async {

  // Datasources
  locator.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(box: box));

  // Repositories
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userLocalDataSource: locator<UserLocalDataSource>()),
  );

  // UseCases
  locator.registerLazySingleton<FetchUsersUseCase>(() => FetchUsersUseCase(userRepository: locator<UserRepository>()));
  locator.registerLazySingleton<SaveUserUseCase>(() => SaveUserUseCase(userRepository: locator<UserRepository>()));
  locator.registerLazySingleton<UpdateUserUseCase>(() => UpdateUserUseCase(userRepository: locator<UserRepository>()));
  locator.registerLazySingleton<AddTemporaryAddressUseCase>(() => AddTemporaryAddressUseCase());

  // Bloc
  locator.registerLazySingleton<UserRegistrationBloc>(() => UserRegistrationBloc());
  locator.registerFactory<WelcomeBloc>(() => WelcomeBloc());
}