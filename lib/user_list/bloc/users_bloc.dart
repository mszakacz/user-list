import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<UpdateUsersList>(_onUpdateUsersList);
  }

  Future<void> _onUpdateUsersList(
      UpdateUsersList event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    try {
      final _usersListRepository = UsersListRepository();
      final List<User> users = await _usersListRepository.getUsersList();
      return emit(state.copyWith(
        users: users,
        status: UsersStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }
}
