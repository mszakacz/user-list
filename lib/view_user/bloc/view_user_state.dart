part of 'view_user_bloc.dart';

enum UserActivationStatus {
  loading,
  active,
  locked,
  failure,
}

class UserState extends Equatable {
  final UserActivationStatus status;
  final User user;
  const UserState({
    this.status = UserActivationStatus.loading,
    this.user = const User(),
  });

  @override
  List<Object> get props => [status, user];

  UserState copyWith({
    User? user,
    UserActivationStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
