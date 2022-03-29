import 'package:flutter/material.dart';
import 'package:user_list/edit_user/bloc/edit_user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/edit_user/widgets/widgets.dart';

class EditUserWidget extends StatelessWidget {
  const EditUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserBloc, EditUserState>(
      builder: (context, state) {
        switch (state.status) {
          case EditUserStatus.edit:
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const UserPropertiesForm(),
                ElevatedButton(
                  onPressed: () async {
                    context.read<EditUserBloc>().add(SaveUser());
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pop(context);
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            );

          case EditUserStatus.loading:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 50),
                Text('Updating...'),
              ],
            );

          case EditUserStatus.posting:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 50),
                Text('Updating...'),
              ],
            );

          default:
            return Container();
        }
      },
    );
  }
}
