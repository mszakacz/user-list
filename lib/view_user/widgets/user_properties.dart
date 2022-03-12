import 'package:flutter/material.dart';
import 'package:user_list/view_user/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';

class UserPropertiesWidget extends StatelessWidget {
  const UserPropertiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserBloc, ViewUserState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            UserPropertyWidget(
              name: 'id:',
              value: state.user.id.toString(),
            ),
            UserPropertyWidget(
              name: 'Name:',
              value: state.user.firstname,
            ),
            UserPropertyWidget(
              name: 'Lastname:',
              value: state.user.lastname,
            ),
            UserPropertyWidget(
              name: 'Status:',
              value: state.user.status,
            ),
            UserPropertyWidget(
              name: 'Created at:',
              value: dateString(state.user.createdAt),
            ),
            UserPropertyWidget(
              name: 'Updated at:',
              value: dateString(state.user.updatedAt),
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }

  String dateString(String date) {
    return date.substring(0, 10) + '  ' + date.substring(11, 16);
  }
}
