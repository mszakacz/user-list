import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:users_repository/users_repository.dart';
import 'package:users_api/users_api.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<UpdateUsersList>(_onUpdateUsersList);
    on<ChangeSortingMethod>(_onChangeSortingMethod);
  }

  Future<void> _onUpdateUsersList(
      UpdateUsersList event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    try {
      final _userApi = UsersApiClient();
      final _usersListRepository = UsersRepository(usersApiClient: _userApi);
      final List<User> users = await _usersListRepository.getUsersList();
      final List<User> sortedUsers =
          await _usersListRepository.sortList(users, state.sortingBy);
      return emit(state.copyWith(
        users: sortedUsers,
        status: UsersStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }

  Future<void> _onChangeSortingMethod(
      ChangeSortingMethod event, Emitter<UsersState> emit) async {
    emit(state.copyWith(sortingBy: event.sortingBy));
  }
}
