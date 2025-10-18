import 'package:dartz/dartz.dart';
import 'package:register_app/data/datasources/user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  
  @override
  Future<Either<String, void>> saveName({required String name}) {
    // Aquí iría la lógica para guardar el nombre localmente.
    // Por simplicidad, asumimos que siempre es exitoso.
    return Future.value(Right(null));
  }
  
}