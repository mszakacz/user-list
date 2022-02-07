import 'package:flutter/material.dart';
import 'package:user_list/edit_user/bloc/edit_user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/edit_user/widgets/edit_user_widget.dart';

class EditPage extends StatelessWidget {
  final int id;
  const EditPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditUserBloc()..add(SetUserByID(id)),
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
