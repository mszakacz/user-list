part of 'new_user_bloc.dart';

enum NewUserStatus {
  initial,
  posting,
  saved,
  failure,
}

class NewUserState extends Equatable {
  final NewUserStatus status;
  final String firstname;
  final String lastname;

  const NewUserState({
    required this.status,
    required this.firstname,
    required this.lastname,
  });

  @override
  List<Object> get props => [
        status,
        firstname,
        lastname,
      ];

  NewUserState copyWith({
    NewUserStatus? status,
    String? firstname,
    String? lastname,
  }) {
    return NewUserState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }
}
