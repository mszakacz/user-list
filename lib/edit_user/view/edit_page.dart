import 'package:flutter/material.dart';
import 'package:user_list/edit_user/bloc/edit_user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/edit_user/widgets/edit_user_widget.dart';
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
