part of 'view_user_bloc.dart';

enum UserActivationStatus {
  loading,
  active,
  locked,
  failure,
  deleted,
}

class ViewUserState extends Equatable {
  final UserActivationStatus status;
  final User user;
  const ViewUserState({
    this.status = UserActivationStatus.loading,
    this.user = const User(),
  });

  @override
  List<Object> get props => [status, user];

  ViewUserState copyWith({
    User? user,
    UserActivationStatus? status,
  }) {
    return ViewUserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
