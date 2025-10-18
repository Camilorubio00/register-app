import 'package:get_it/get_it.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';
import 'package:register_app/data/datasources/user_local_data_source_impl.dart';
import 'package:register_app/data/repositories/user_repository_impl.dart';
import 'package:register_app/domain/repositories/user_repository.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_bloc.dart';
import 'package:register_app/presentation/name/bloc/name_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {

  // Datasources
  locator.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl());

  // Repositories
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userLocalDataSource: locator<UserLocalDataSource>()),
  );

  // UseCases
  locator.registerLazySingleton<UpdateUserUseCase>(() => UpdateUserUseCase(userRepository: locator<UserRepository>()));

  // Bloc
  locator.registerFactory<NameBloc>(() => NameBloc());
  locator.registerFactory<LastnameBloc>(() => LastnameBloc());
}