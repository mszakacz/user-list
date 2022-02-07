part of 'view_user_bloc.dart';

abstract class ViewUserEvent extends Equatable {
  const ViewUserEvent();

  @override
  List<Object> get props => [];
}

class ActivateUser extends ViewUserEvent {}

class LockUser extends ViewUserEvent {}

class GetUserFromDB extends ViewUserEvent {}

class GetUserFromMemory extends ViewUserEvent {
  final User user;
  const GetUserFromMemory(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUser extends ViewUserEvent {}
