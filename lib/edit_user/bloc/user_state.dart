part of 'user_bloc.dart';

enum UserStatus { view, edit, failure }

class UserState extends Equatable {
  final User user;
  final UserStatus status;

  const UserState({
    required this.user,
    required this.status,
  });

  @override
  List<Object> get props => [user, status];
}
