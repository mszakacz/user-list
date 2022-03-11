import 'package:flutter/material.dart';
import 'package:user_list/app/view/app.dart';
import 'package:users_api/users_api.dart';
import 'package:users_repository/users_repository.dart';

void main() {
  final UsersApiClient usersApiClient = UsersApiClient();

  final UsersRepository usersRepository =
      UsersRepository(usersApiClient: usersApiClient);

  runApp(
    App(
      usersRepository: usersRepository,
    ),
  );
}
