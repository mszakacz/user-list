import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/new_user/new_user.dart';
import 'package:users_repository/users_repository.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const NewUserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserBloc(
        usersRepository: RepositoryProvider.of<UsersRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new user'),
        ),
        body: BlocBuilder<NewUserBloc, NewUserState>(
          builder: (context, state) {
            switch (state.status) {
              case NewUserStatus.initial:
                return const NewUserForm();

              case NewUserStatus.failure:
                return const Center(child: Text('Failed to post new user'));

              case NewUserStatus.saved:
                return const Center(
                    child: Text(
                        'New user has been created and posted successfully'));

              default:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 50),
                      Text('Posting the User...'),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
