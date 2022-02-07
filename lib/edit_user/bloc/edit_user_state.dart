part of 'edit_user_bloc.dart';

enum EditUserStatus {
  edit,
  posting,
  loading,
  failure,
}

class UserState extends Equatable {
  final User user;
  final EditUserStatus status;

  const UserState({
    required this.user,
    required this.status,
  });

  @override
  List<Object> get props => [user, status];

  UserState copyWith({
    User? user,
    EditUserStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
