import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/new_user/new_user.dart';
import 'package:user_list/sorting/view/view.dart';
import 'package:user_list/user_list/widgets/users_list.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:users_repository/users_repository.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const UsersPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(
        usersRepository: RepositoryProvider.of<UsersRepository>(context),
      )..add(
          UpdateUsersList(),
        ),
      child: const UsersView(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        centerTitle: false,
        backgroundColor: Colors.grey[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(
                    SettingsPage.route(),
                  )
                  .whenComplete(
                    () => context.read<UsersBloc>().add(
                          UpdateUsersList(),
                        ),
                  );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(
                    NewUserPage.route(),
                  )
                  .whenComplete(
                    () => context.read<UsersBloc>().add(
                          UpdateUsersList(),
                        ),
                  );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<UsersBloc>().add(
                    UpdateUsersList(),
                  );
            },
          )
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return const Center(
            child: UsersListWidget(),
          );
        },
      ),
    );
  }
}
