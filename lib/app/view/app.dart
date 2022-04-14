import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/user_list.dart';
import 'package:users_repository/users_repository.dart';
import 'package:user_list/theme/theme.dart';

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
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      theme: UserListTheme.light,
      // TODO: Dark mode does not look good, fix it
      // darkTheme: UserListTheme.dark,
      home: const UsersPage(),
    );
  }
}
