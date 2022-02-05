import 'dart:async';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class NewUserForm extends StatefulWidget {
  const NewUserForm({Key? key}) : super(key: key);

  @override
  State<NewUserForm> createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _lastnameTextController = TextEditingController();

  String get _name => _nameTextController.text;
  String get _lastname => _lastnameTextController.text;

  @override
  void dispose() {
    _nameTextController.dispose();
    _lastnameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
          child: TextField(
            controller: _nameTextController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 0, 100, 100),
          child: TextField(
            controller: _lastnameTextController,
            decoration: const InputDecoration(
              labelText: 'Lastname',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Create'),
        ),
      ],
    );
  }
}
