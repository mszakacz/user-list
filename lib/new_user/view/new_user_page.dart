import 'package:flutter/material.dart';
import 'package:user_list/new_user/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/new_user/cubit/new_user_cubit.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const NewUserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new user'),
        ),
        body: BlocBuilder<NewUserCubit, NewUserState>(
          builder: (context, state) {
            switch (state.status) {
              case NewUserStatus.initial:
                return const NewUserForm();

              case NewUserStatus.failure:
                return const Center(child: Text('Failed to post new user'));

              case NewUserStatus.saved:
                return const Center(
                    child: Text(
                        'New user has been created and posted successfully'));

              default:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 50),
                      Text('Posting the User...'),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
