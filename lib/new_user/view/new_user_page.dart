import 'package:flutter/material.dart';
import 'package:user_list/new_user/widgets/widgets.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new user'),
      ),
      body: const NewUserForm(),
    );
  }
}
