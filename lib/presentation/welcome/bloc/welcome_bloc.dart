import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/injection_service.dart';
import 'package:register_app/domain/usecases/fetch_users_use_case.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_event.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_state.dart';
import 'package:register_app/presentation/welcome/model/user_ui_model.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final FetchUsersUseCase _fetchUsersUseCase;

  WelcomeBloc({
    FetchUsersUseCase? fetchUsersUseCase
  }) : _fetchUsersUseCase = fetchUsersUseCase ?? locator<FetchUsersUseCase>(),
        super(WelcomeInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
      FetchUsers event,
      Emitter<WelcomeState> emit,
      ) async {
    emit(WelcomeLoading());
    final result = await _fetchUsersUseCase.call();
    result.fold(
          (error) => emit(WelcomeError(error)),
          (value) {
            final userUiModelList = value.map((model) => UserUiModel.fromModel(userModel: model)).toList();
            emit(UsersLoaded(userUiModelList));
          }
    );
  }
}