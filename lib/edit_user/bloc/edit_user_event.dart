part of 'edit_user_bloc.dart';

class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object> get props => [];
}

class SaveUser extends EditUserEvent {}

class NameEditing extends EditUserEvent {
  final String firstname;
  const NameEditing(this.firstname);
}

class LastnameEditing extends EditUserEvent {
  final String lastname;
  const LastnameEditing(this.lastname);
}

class SetUserByID extends EditUserEvent {
  final int id;
  const SetUserByID(this.id);

  @override
  List<Object> get props => [id];
}
