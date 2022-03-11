part of 'new_user_bloc.dart';

abstract class NewUserEvent extends Equatable {
  const NewUserEvent();

  @override
  List<Object> get props => [];
}

class CreateNewUser extends NewUserEvent {
  const CreateNewUser({
    required this.firstname,
    required this.lastname,
  });
  final String firstname;
  final String lastname;
}
