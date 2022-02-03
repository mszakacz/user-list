import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_list/user_list/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
            status: UserStatus.failure,
            user: User(
              id: 0,
              lastname: '',
              firstname: '',
              status: '',
              createdAt: '',
              updatedAt: '',
              url: '',
            ))) {
    on<UserEvent>((event, emit) {});
  }
}
