import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:user_repository/user_repository.dart';

part 'view_user_event.dart';
part 'view_user_state.dart';

class ViewUserBloc extends Bloc<ViewUserEvent, UserState> {
  ViewUserBloc()
      : super(const UserState(status: UserActivationStatus.loading)) {
    on<ActivateUser>(_onActivateUser);
    on<LockUser>(_onLockUser);
    on<GetUserFromDB>(_onGetUserFromDB);
    on<GetUserFromMemory>(_onGetUserFromMemory);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onGetUserFromMemory(
      GetUserFromMemory event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserActivationStatus.loading));
    try {
      UserActivationStatus status;
      if (event.user.status == 'active') {
        status = UserActivationStatus.active;
      } else {
        status = UserActivationStatus.locked;
      }
      emit(state.copyWith(user: event.user, status: status));
    } catch (_) {
      emit(state.copyWith(status: UserActivationStatus.failure));
    }
  }

  Future<void> _onGetUserFromDB(
      GetUserFromDB event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserActivationStatus.loading));
    try {
      final UserRepository _userRepository = UserRepository();
      final user = await _userRepository.getUser(state.user.id);
      UserActivationStatus status;
      if (user.status == 'active') {
        status = UserActivationStatus.active;
      } else {
        status = UserActivationStatus.locked;
      }
      emit(state.copyWith(user: user, status: status));
    } catch (_) {
      emit(state.copyWith(status: UserActivationStatus.failure));
    }
  }

  Future<void> _onActivateUser(
      ActivateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserActivationStatus.loading));
    try {
      final UserRepository _userRepository = UserRepository();
      User user = state.user.copyWith(status: 'active');
      await _userRepository.updateUser(user);
      emit(state.copyWith(status: UserActivationStatus.active, user: user));
    } catch (_) {
      emit(state.copyWith(status: UserActivationStatus.failure));
    }
  }

  Future<void> _onLockUser(LockUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserActivationStatus.loading));
    try {
      final UserRepository _userRepository = UserRepository();
      User user = state.user.copyWith(status: 'locked');
      await _userRepository.updateUser(user);
      emit(state.copyWith(status: UserActivationStatus.locked, user: user));
    } catch (_) {
      emit(state.copyWith(status: UserActivationStatus.failure));
    }
  }

  Future<void> _onDeleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserActivationStatus.loading));
    try {
      final UserRepository _userRepository = UserRepository();
      await _userRepository.deleteUser(state.user.id);
      emit(state.copyWith(
          status: UserActivationStatus.deleted, user: const User()));
    } catch (_) {
      emit(state.copyWith(status: UserActivationStatus.failure));
    }
  }
}
