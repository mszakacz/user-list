import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:users_repository/users_repository.dart';

part 'view_user_event.dart';
part 'view_user_state.dart';

class ViewUserBloc extends Bloc<ViewUserEvent, ViewUserState> {
  ViewUserBloc({required this.usersRepository})
      : super(
          const ViewUserState(),
        ) {
    on<ActivateUser>(_onActivateUser);
    on<LockUser>(_onLockUser);
    on<GetUserFromDB>(_onGetUserFromDB);
    on<GetUserFromMemory>(_onGetUserFromMemory);
    on<DeleteUser>(_onDeleteUser);
  }

  final UsersRepository usersRepository;

  Future<void> _onGetUserFromMemory(
      GetUserFromMemory event, Emitter<ViewUserState> emit) async {
    emit(
      const ViewUserState(status: ViewUserStatus.loading),
    );
    try {
      ViewUserStatus status;
      if (event.user.status == 'active') {
        status = ViewUserStatus.active;
      } else {
        status = ViewUserStatus.locked;
      }
      emit(
        state.copyWith(
          user: event.user,
          status: status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(message: ViewUserMessage.failureToGet),
      );
    }
  }

  Future<void> _onGetUserFromDB(
      GetUserFromDB event, Emitter<ViewUserState> emit) async {
    emit(state.copyWith(status: ViewUserStatus.loading));
    try {
      final user = await usersRepository.getUser(state.user.id);
      ViewUserStatus status;
      if (user.status == 'active') {
        status = ViewUserStatus.active;
      } else {
        status = ViewUserStatus.locked;
      }
      emit(
        ViewUserState(
          user: user,
          status: status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(message: ViewUserMessage.failureToGet),
      );
    }
  }

  Future<void> _onActivateUser(
      ActivateUser event, Emitter<ViewUserState> emit) async {
    try {
      User user = state.user.copyWith(status: 'active');
      await usersRepository.updateUser(user);
      emit(
        state.copyWith(
          status: ViewUserStatus.active,
          user: user,
          message: ViewUserMessage.activated,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(message: ViewUserMessage.failureToActivate),
      );
      emit(
        state.copyWith(message: ViewUserMessage.empty),
      );
    }
  }

  Future<void> _onLockUser(LockUser event, Emitter<ViewUserState> emit) async {
    try {
      User user = state.user.copyWith(status: 'locked');
      await usersRepository.updateUser(user);
      emit(
        state.copyWith(
          status: ViewUserStatus.locked,
          user: user,
          message: ViewUserMessage.locked,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(message: ViewUserMessage.failureToLock),
      );
      emit(
        state.copyWith(message: ViewUserMessage.empty),
      );
    }
  }

  Future<void> _onDeleteUser(
      DeleteUser event, Emitter<ViewUserState> emit) async {
    emit(state.copyWith(status: ViewUserStatus.loading));
    try {
      await usersRepository.deleteUser(state.user.id);
      emit(
        state.copyWith(
          status: ViewUserStatus.deleted,
          user: const User(),
          message: ViewUserMessage.deleted,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(message: ViewUserMessage.failureToDelete),
      );
    }
  }
}
