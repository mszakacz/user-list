import 'package:flutter/material.dart';
import 'package:user_list/view_user/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';

class UserPropertiesWidget extends StatelessWidget {
  const UserPropertiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserBloc, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                UserPropertyNameWidget(text: 'id:'),
                UserPropertyNameWidget(text: 'Name:'),
                UserPropertyNameWidget(text: 'Lastname:'),
                UserPropertyNameWidget(text: 'Status:'),
                UserPropertyNameWidget(text: 'Created at:'),
                UserPropertyNameWidget(text: 'Updated at:'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserPropertyValueWidget(text: state.user.id.toString()),
                UserPropertyValueWidget(text: state.user.firstname),
                UserPropertyValueWidget(text: state.user.lastname),
                UserPropertyValueWidget(text: state.user.status),
                UserPropertyValueWidget(text: dateString(state.user.createdAt)),
                UserPropertyValueWidget(text: dateString(state.user.updatedAt)),
              ],
            ),
          ],
        );
      },
    );
  }

  String dateString(String date) {
    return date.substring(0, 10) + '  ' + date.substring(11, 16);
  }
}
