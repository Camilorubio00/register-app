import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/fetch_user_use_case.dart';
import 'package:register_app/domain/usecases/save_name_use_case.dart';
import 'package:register_app/presentation/name/bloc/name_event.dart';
import 'package:register_app/presentation/name/bloc/name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final SaveNameUseCase _saveNameUseCase;

  NameBloc({
    FetchUserUseCase? fetchUserUseCase,
    SaveNameUseCase? saveNameUseCase
  }) : _saveNameUseCase = saveNameUseCase ?? locator<SaveNameUseCase>(), 
  super(NameInitial()) {
    on<SaveName>(_onSaveName);
    on<ChangeName>(_onChangeName);
  }

  Future<void> _onSaveName(
    SaveName event,
    Emitter<NameState> emit,
  ) async {
    emit(NameLoading());
    
    final result = await _saveNameUseCase.saveName(name: "");
    
    result.fold(
      (error) => emit(NameError(error)),
      (_) => emit(NameSaved(event.name)),
    );
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<NameState> emit,
  ) async {
    emit(NameValidated(event.name.isEmpty));
  }
}