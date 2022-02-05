import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:user_list/user_list/widgets/user_list_item.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  _UsersListWidgetState createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        switch (state.status) {
          case UsersStatus.failure:
            return const Center(child: Text('Failed to get the Users'));
          case UsersStatus.success:
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return UserListItem(user: state.users[index]);
              },
              itemCount: state.users.length,
            );
          default:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 50),
                Text('Retrieving the Users...'),
              ],
            );
        }
      },
    );
  }
}
