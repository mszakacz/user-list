import 'package:flutter/material.dart';
import 'package:user_list/edit_user/edit_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/view_user/view_user.dart';

class ViewUserWidget extends StatelessWidget {
  const ViewUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserBloc, ViewUserState>(
      builder: (context, state) {
        switch (state.status) {
          case UserActivationStatus.failure:
            return const Center(child: Text('Failed to get/post the User'));

          case UserActivationStatus.loading:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 50),
                Text('Updating...'),
              ],
            );

          case UserActivationStatus.deleted:
            return const Center(
                child: Text('User has been successfully deleted'));

          default:
            return Column(
              children: [
                const Flexible(
                  flex: 6,
                  child: UserPropertiesWidget(),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      const UserActivationButton(),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context)
                              .push(
                                EditPage.route(state.user.id),
                              )
                              .whenComplete(() => context
                                  .read<ViewUserBloc>()
                                  .add(GetUserFromDB())),
                          child: const Text('Edit the user'),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () =>
                              context.read<ViewUserBloc>().add(DeleteUser()),
                          child: const Text('Delete the user'),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
