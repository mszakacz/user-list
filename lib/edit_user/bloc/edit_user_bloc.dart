import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:user_repository/user_repository.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, UserState> {
  EditUserBloc()
      : super(const UserState(status: EditUserStatus.loading, user: User())) {
    on<SetUserByID>(_onSetUserByID);
    on<NameEditing>(_onNameEditing);
    on<LastnameEditing>(_onLastnameEditing);
    on<SaveUser>(_onSaveUser);
  }

  Future<void> _onSetUserByID(
      SetUserByID event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: EditUserStatus.loading));
    try {
      final UserRepository _userRepository = UserRepository();
      final user = await _userRepository.getUser(event.id);
      emit(state.copyWith(user: user, status: EditUserStatus.edit));
    } catch (_) {
      emit(state.copyWith(status: EditUserStatus.failure));
    }
  }

  void _onNameEditing(NameEditing event, Emitter<UserState> emit) {
    emit(state.copyWith(user: state.user.copyWith(firstname: event.firstname)));
  }

  void _onLastnameEditing(LastnameEditing event, Emitter<UserState> emit) {
    emit(state.copyWith(user: state.user.copyWith(lastname: event.lastname)));
  }

  Future<void> _onSaveUser(SaveUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: EditUserStatus.posting));
    try {
      final UserRepository _userRepository = UserRepository();
      await _userRepository.updateUser(state.user);
    } catch (_) {
      emit(state.copyWith(status: EditUserStatus.failure));
    }
  }
}