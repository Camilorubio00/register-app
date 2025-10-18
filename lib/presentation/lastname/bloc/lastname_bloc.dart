import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/save_lastname_use_case.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_event.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_state.dart';

class LastnameBloc extends Bloc<LastnameEvent, LastnameState> {
  final SaveLastnameUseCase _saveLastnameUseCase;

  LastnameBloc({
    SaveLastnameUseCase? saveLastnameUseCase
  }) : _saveLastnameUseCase = saveLastnameUseCase ?? locator<SaveLastnameUseCase>(), 
  super(LastnameInitial()) {
    on<SaveLastname>(_onSaveLastname);
    on<ChangeLastname>(_onChangeLastname);
  }

  Future<void> _onSaveLastname(
    SaveLastname event,
    Emitter<LastnameState> emit,
  ) async {
    emit(LastnameLoading());
    
    final result = await _saveLastnameUseCase.call(lastname: "");
    
    result.fold(
      (error) => emit(LastnameError(error)),
      (_) => emit(LastnameSaved(event.lastname)),
    );
  }

  Future<void> _onChangeLastname(
    ChangeLastname event,
    Emitter<LastnameState> emit,
  ) async {
    emit(LastnameValidated(event.lastname.isEmpty));
  }
}