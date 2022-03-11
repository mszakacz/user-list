import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:users_repository/users_repository.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit({required this.usersRepository})
      : super(const NewUserState(
          status: NewUserStatus.initial,
          firstname: '',
          lastname: '',
        ));

  final UsersRepository usersRepository;

  Future<void> createNewUser(String firstname, String lastname) async {
    emit(state.copyWith(status: NewUserStatus.posting));
    try {
      await usersRepository.createAndPostNewUser(
        firstname,
        lastname,
      );
      return emit(state.copyWith(status: NewUserStatus.saved));
    } catch (_) {
      emit(state.copyWith(status: NewUserStatus.failure));
    }
  }
}
