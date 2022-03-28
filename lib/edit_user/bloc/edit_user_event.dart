part of 'edit_user_bloc.dart';

class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object> get props => [];
}

class SaveUser extends EditUserEvent {}

class NameEditing extends EditUserEvent {
  const NameEditing(this.firstname);

  final String firstname;

  @override
  List<Object> get props => [firstname];
}

class LastnameEditing extends EditUserEvent {
  const LastnameEditing(this.lastname);

  final String lastname;

  @override
  List<Object> get props => [lastname];
}

class SetUserByID extends EditUserEvent {
  const SetUserByID(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
