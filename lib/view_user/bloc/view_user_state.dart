part of 'view_user_bloc.dart';

enum ViewUserStatus {
  loading,
  active,
  locked,
  deleted,
}

enum ViewUserMessage {
  activated,
  locked,
  failureToActivate,
  failureToLock,
  failureToDelete,
  failureToGet,
  empty,
  deleted,
}

class ViewUserState extends Equatable {
  const ViewUserState({
    this.status = ViewUserStatus.loading,
    this.user = const User(),
    this.message = ViewUserMessage.empty,
  });
  final ViewUserStatus status;
  final User user;
  final ViewUserMessage message;

  @override
  List<Object> get props => [status, user, message];

  ViewUserState copyWith({
    ViewUserStatus? status,
    User? user,
    ViewUserMessage? message,
  }) {
    return ViewUserState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }
}
