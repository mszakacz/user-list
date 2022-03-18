import 'package:flutter/material.dart';
import 'package:users_repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/view_user.dart';

class ViewUserPage extends StatelessWidget {
  final User user;
  const ViewUserPage({Key? key, required this.user}) : super(key: key);

  static Route<void> route(User user) {
    return MaterialPageRoute(
      builder: (context) => ViewUserPage(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewUserBloc(
        usersRepository: RepositoryProvider.of<UsersRepository>(
          context,
        ),
      )..add(
          GetUserFromMemory(user),
        ),
      child: const ViewUserView(),
    );
  }
}

class ViewUserView extends StatelessWidget {
  const ViewUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewUserBloc, ViewUserState>(
      listenWhen: (previous, current) => previous.message != current.message,
      listener: (context, state) {
        if (state.message == ViewUserMessage.failureToGet) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to get the User'),
              ),
            );
        }

        if (state.message == ViewUserMessage.deleted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('User deleted'),
              ),
            );
        }

        if (state.message == ViewUserMessage.failureToDelete) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to delete the User'),
              ),
            );
        }

        if (state.message == ViewUserMessage.activated) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('User has been activated'),
              ),
            );
        }

        if (state.message == ViewUserMessage.failureToActivate) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to activate the User'),
              ),
            );
        }

        if (state.message == ViewUserMessage.locked) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('User has been locked'),
              ),
            );
        }

        if (state.message == ViewUserMessage.failureToLock) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to lock the User'),
              ),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View User'),
        ),
        body: const Center(
          child: ViewUserWidget(),
        ),
      ),
    );
  }
}
