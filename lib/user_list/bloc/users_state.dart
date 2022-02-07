part of 'users_bloc.dart';

enum UsersStatus {
  loading,
  success,
  failure,
}

enum SortingBy {
  id,
  creationTime,
  updateTime,
  firstname,
  lastname,
}

class UsersState extends Equatable {
  final List<User> users;
  final UsersStatus status;
  final SortingBy sortingBy;

  const UsersState({
    this.users = const <User>[],
    this.status = UsersStatus.loading,
    this.sortingBy = SortingBy.creationTime,
  });

  @override
  List<Object> get props => [
        users,
        status,
        sortingBy,
      ];

  UsersState copyWith({
    List<User>? users,
    UsersStatus? status,
    SortingBy? sortingBy,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      sortingBy: sortingBy ?? this.sortingBy,
    );
  }
}
