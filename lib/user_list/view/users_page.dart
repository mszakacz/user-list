import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/widgets/users_list.dart';
import 'package:user_list/user_list/cubit/users_cubit.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: false,
        backgroundColor: Colors.grey[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              BlocProvider.of<UsersCubit>(context).refreshList();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content: BlocBuilder<UsersCubit, UsersState>(
                    builder: (context, state) {
                      print(state.lastAvailableList[0].firstname);
                      if (state.isUpToDate) {
                        return Text(
                          'Users List is up to date.',
                        );
                      } else {
                        return Text(
                          'Communication with the server failed. Try one more time after few minutes.',
                        );
                      }
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return Center(
            child: UsersListWidget(),
            // child: Text(state.lastAvailableList[0].firstname),
          );
        },
      ),
    );
  }
}
