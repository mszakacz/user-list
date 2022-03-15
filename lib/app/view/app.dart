import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/user_list.dart';
import 'package:users_repository/users_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.usersRepository,
  }) : super(key: key);

  final UsersRepository usersRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UsersRepository>.value(
      value: usersRepository,
      child: BlocProvider(
        create: (context) => UsersBloc(
          usersRepository: RepositoryProvider.of<UsersRepository>(context),
        )..add(
            UpdateUsersList(),
          ),
        child: MaterialApp(
          title: 'User List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const UsersPage(),
        ),
      ),
    );
  }
}
