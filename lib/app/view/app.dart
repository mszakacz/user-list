import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/app/app.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:user_list/edit_user/bloc/edit_user_bloc.dart';
import 'package:user_list/new_user/cubit/new_user_cubit.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (context) => UsersBloc()..add(UpdateUsersList()),
        ),
      ],
      child: MaterialApp(
        title: 'User List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRout,
      ),
    );
  }
}
