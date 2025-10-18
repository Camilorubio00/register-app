import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/name/bloc/name_event.dart';
import 'package:register_app/presentation/name/bloc/name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final UpdateUserUseCase _updateUserUseCase;

  NameBloc({
    UpdateUserUseCase? updateUserUseCase
  }) : _updateUserUseCase = updateUserUseCase ?? locator<UpdateUserUseCase>(),
  super(NameInitial()) {
    on<SaveName>(_onSaveName);
    on<ChangeName>(_onChangeName);
  }

  Future<void> _onSaveName(
    SaveName event,
    Emitter<NameState> emit,
  ) async {
    emit(NameLoading());
    await _updateUserUseCase.call(name: event.name);
    emit(NameSaved());
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<NameState> emit,
  ) async {
    emit(NameValidated(event.name.isEmpty));
  }
}