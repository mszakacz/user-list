import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:users_repository/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.usersRepository}) : super(const UsersState()) {
    on<UpdateUsersList>(_onUpdateUsersList);
    on<ChangeSortingMethod>(_onChangeSortingMethod);
  }

  final UsersRepository usersRepository;

  Future<void> _onUpdateUsersList(
      UpdateUsersList event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    try {
      final List<User> users = await usersRepository.getUsersList();
      final List<User> sortedUsers =
          await usersRepository.sortList(users, state.sortingBy);
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
