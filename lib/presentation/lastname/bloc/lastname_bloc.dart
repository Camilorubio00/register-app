import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_event.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_state.dart';

class LastnameBloc extends Bloc<LastnameEvent, LastnameState> {
  final UpdateUserUseCase _updateUserUseCase;

  LastnameBloc({
    UpdateUserUseCase? updateUserUseCase
  }) : _updateUserUseCase = updateUserUseCase ?? locator<UpdateUserUseCase>(),
  super(LastnameInitial()) {
    on<SaveLastname>(_onSaveLastname);
    on<ChangeLastname>(_onChangeLastname);
  }

  Future<void> _onSaveLastname(
    SaveLastname event,
    Emitter<LastnameState> emit,
  ) async {
    emit(LastnameLoading());
    await _updateUserUseCase.call(lastname: event.lastname);
    emit(LastnameSaved());
  }

  Future<void> _onChangeLastname(
    ChangeLastname event,
    Emitter<LastnameState> emit,
  ) async {
    emit(LastnameValidated(event.lastname.isEmpty));
  }
}