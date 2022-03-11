import 'package:flutter/material.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_repository/users_repository.dart';

class SortingSettingsWidget extends StatefulWidget {
  const SortingSettingsWidget({Key? key}) : super(key: key);

  @override
  _SortingSettingsWidgetState createState() => _SortingSettingsWidgetState();
}

class _SortingSettingsWidgetState extends State<SortingSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Text(
                'Sort by:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: const Text('ID (descending)'),
              leading: Radio(
                value: SortingBy.idDescending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('ID (ascending)'),
              leading: Radio(
                value: SortingBy.idAscending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Creation Time (descending)'),
              leading: Radio(
                value: SortingBy.creationTimeDescending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Creation Time (ascending)'),
              leading: Radio(
                value: SortingBy.creationTimeAscending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Update Time (descending)'),
              leading: Radio(
                value: SortingBy.updateTimeDescending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Update Time (ascending)'),
              leading: Radio(
                value: SortingBy.updateTimeAscending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Firstname (descending)'),
              leading: Radio(
                value: SortingBy.firstnameDescending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Firstname (ascending)'),
              leading: Radio(
                value: SortingBy.firstnameAscending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Lastname (descending)'),
              leading: Radio(
                value: SortingBy.lastnameDescending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
            ListTile(
              title: const Text('Lastname (ascending)'),
              leading: Radio(
                value: SortingBy.lastnameAscending,
                groupValue: state.sortingBy,
                onChanged: (SortingBy? value) => {
                  BlocProvider.of<UsersBloc>(context)
                      .add(ChangeSortingMethod(value))
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
