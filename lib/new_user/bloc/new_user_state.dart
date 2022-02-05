part of 'new_user_bloc.dart';

enum NewUserStatus {
  initial,
}

abstract class NewUserState extends Equatable {
  const NewUserState();

  @override
  List<Object> get props => [];
}

class NewUserInitial extends NewUserState {}
