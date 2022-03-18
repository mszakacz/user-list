part of 'edit_user_bloc.dart';

enum EditUserStatus {
  edit,
  posting,
  loading,
  failure,
  success,
  failureToGet,
}

class EditUserState extends Equatable {
  final User user;
  final EditUserStatus status;

  const EditUserState({
    required this.user,
    required this.status,
  });

  @override
  List<Object> get props => [user, status];

  EditUserState copyWith({
    User? user,
    EditUserStatus? status,
  }) {
    return EditUserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
