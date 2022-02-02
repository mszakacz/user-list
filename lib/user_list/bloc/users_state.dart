part of 'users_bloc.dart';

enum UsersStatus { loading, success, failure }

class UsersState extends Equatable {
  final List<User> users;
  final UsersStatus status;

  const UsersState({
    this.users = const <User>[],
    this.status = UsersStatus.loading,
  });

  @override
  List<Object> get props => [
        users,
        status,
      ];

  UsersState copyWith({
    List<User>? users,
    UsersStatus? status,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }
}
