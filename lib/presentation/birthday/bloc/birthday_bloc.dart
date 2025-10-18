import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/update_user_use_case.dart';
import 'package:register_app/presentation/birthday/bloc/birthday_event.dart';
import 'package:register_app/presentation/birthday/bloc/birthday_state.dart';

class BirthdayBloc extends Bloc<BirthdayEvent, BirthdayState> {
  final UpdateUserUseCase _updateUserUseCase;

  BirthdayBloc({UpdateUserUseCase? updateUserUseCase})
    : _updateUserUseCase = updateUserUseCase ?? locator<UpdateUserUseCase>(),
      super(BirthdayInitial()) {
    on<SaveBirthday>(_onSaveBirthday);
    on<ChangeBirthday>(_onChangeBirthday);
  }

  Future<void> _onSaveBirthday(
    SaveBirthday event,
    Emitter<BirthdayState> emit,
  ) async {
    emit(BirthdayLoading());
    await _updateUserUseCase.call(birthDate: event.birthday);
    emit(BirthdaySaved());
  }

  Future<void> _onChangeBirthday(
    ChangeBirthday event,
    Emitter<BirthdayState> emit,
  ) async {
    emit(BirthdayChanged());
  }
}
