part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ViewUser extends UserEvent {}

class EditUser extends UserEvent {}

class SaveUser extends UserEvent {}