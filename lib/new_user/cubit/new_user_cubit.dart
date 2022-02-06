import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:user_repository/user_repository.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit()
      : super(const NewUserState(
          status: NewUserStatus.initial,
          firstname: '',
          lastname: '',
        ));

  Future<void> createNewUser(String firstname, String lastname) async {
    emit(state.copyWith(status: NewUserStatus.posting));
    try {
      final UserRepository _userRepository = UserRepository();
      await _userRepository.createAndPostNewUser(
        firstname,
        lastname,
      );
      return emit(state.copyWith(status: NewUserStatus.saved));
    } catch (_) {
      emit(state.copyWith(status: NewUserStatus.failure));
    }
  }
}
