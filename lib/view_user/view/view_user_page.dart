import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';
import 'package:user_list/view_user/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';

class ViewUserPage extends StatelessWidget {
  final User user;
  const ViewUserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewUserBloc()..add(GetUserFromMemory(user)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Page'),
        ),
        body: const Center(
          child: ViewUserWidget(),
        ),
      ),
    );
  }
}
