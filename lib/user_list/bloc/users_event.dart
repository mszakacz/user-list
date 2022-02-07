part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UpdateUsersList extends UsersEvent {}

class ChangeSortingMethod extends UsersEvent {
  final SortingBy? sortingBy;
  const ChangeSortingMethod(this.sortingBy);
}
