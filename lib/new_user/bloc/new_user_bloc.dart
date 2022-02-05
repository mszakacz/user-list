import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_user_event.dart';
part 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc() : super(NewUserInitial()) {
    on<NewUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
