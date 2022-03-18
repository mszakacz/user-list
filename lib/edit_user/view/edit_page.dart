import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/edit_user/edit_user.dart';
import 'package:users_repository/users_repository.dart';

class EditPage extends StatelessWidget {
  final int id;
  const EditPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  static Route<void> route(int id) {
    return MaterialPageRoute(
      builder: (context) => EditPage(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditUserBloc(
        usersRepository: RepositoryProvider.of<UsersRepository>(context),
      )..add(SetUserByID(id)),
      child: const EditUserView(),
    );
  }
}

class EditUserView extends StatelessWidget {
  const EditUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditUserBloc, EditUserState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == EditUserStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to edit the User'),
              ),
            );
        }

        if (state.status == EditUserStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('User has been edited successfully'),
              ),
            );
        }

        if (state.status == EditUserStatus.failureToGet) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to get a User from Database'),
              ),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit User'),
        ),
        body: const Center(
          child: EditUserWidget(),
        ),
      ),
    );
  }
}
