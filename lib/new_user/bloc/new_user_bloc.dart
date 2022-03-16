import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_repository/users_repository.dart';

part 'new_user_event.dart';
part 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc({
    required this.usersRepository,
  }) : super(
          const NewUserState(
            status: NewUserStatus.initial,
            firstname: '',
            lastname: '',
          ),
        ) {
    on<CreateNewUser>(_onCreateNewUser);
  }

  final UsersRepository usersRepository;

  Future<void> _onCreateNewUser(
      CreateNewUser event, Emitter<NewUserState> emit) async {
    emit(
      state.copyWith(status: NewUserStatus.posting),
    );
    try {
      await usersRepository.postUser(
        event.firstname,
        event.lastname,
      );
      return emit(
        state.copyWith(status: NewUserStatus.saved),
      );
    } catch (_) {
      emit(
        state.copyWith(status: NewUserStatus.failure),
      );
    }
  }
}
