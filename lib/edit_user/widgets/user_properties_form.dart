import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/edit_user/bloc/edit_user_bloc.dart';

import 'dart:async';

class UserPropertiesForm extends StatefulWidget {
  const UserPropertiesForm({Key? key}) : super(key: key);

  @override
  State<UserPropertiesForm> createState() => _UserPropertiesFormState();
}

class _UserPropertiesFormState extends State<UserPropertiesForm> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

  final TextEditingController _firstnameController = TextEditingController()
    ..text = 'Kasia';
  final TextEditingController _lastnameController = TextEditingController()
    ..text = '';

  String get _firstname => _firstnameController.text;
  String get _lastname => _lastnameController.text;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<EditUserBloc, UserState>(
                    builder: (context, state) {
                      return TextFormField(
                        initialValue: state.user.firstname,
                        onChanged: (value) => {
                          BlocProvider.of<EditUserBloc>(context)
                              .add(NameEditing(value))
                        },
                        decoration: const InputDecoration(
                          labelText: 'Firstname',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<EditUserBloc, UserState>(
                    builder: (context, state) {
                      return TextFormField(
                        initialValue: state.user.lastname,
                        onChanged: (value) => {
                          BlocProvider.of<EditUserBloc>(context)
                              .add(LastnameEditing(value))
                        },
                        decoration: const InputDecoration(
                          labelText: 'Lastname',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
