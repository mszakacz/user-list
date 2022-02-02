import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/cubit/users_cubit.dart';
import 'package:user_list/user_list/widgets/user_list_item.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  _UsersListWidgetState createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is WaitingForDataState) {
          print('Waiting for data State');
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return UserListItem(user: state.lastAvailableList[index]);
            },
            itemCount: state.lastAvailableList.length,
          );
        }
      },
    );
  }
}
