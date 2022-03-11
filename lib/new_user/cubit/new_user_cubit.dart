import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:users_repository/users_repository.dart';
import 'package:users_api/users_api.dart';

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
      final UsersApiClient _usersApi = UsersApiClient();
      final UsersRepository _userRepository =
          UsersRepository(usersApiClient: _usersApi);
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
