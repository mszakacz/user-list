import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:user_repository/user_repository.dart';

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
      final _usersListRepository = UsersListRepository();
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
