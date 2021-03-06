import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';

class UserActivationButton extends StatelessWidget {
  const UserActivationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserBloc, ViewUserState>(
      builder: (context, state) {
        if (state.status == ViewUserStatus.locked) {
          return SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => context.read<ViewUserBloc>().add(ActivateUser()),
              child: const Text('Activate User'),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          );
        } else {
          return SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => context.read<ViewUserBloc>().add(LockUser()),
              child: const Text('Lock User'),
              style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
            ),
          );
        }
      },
    );
  }
}
