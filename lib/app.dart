import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/router/router.dart';
import 'package:user_list/user_list/cubit/users_cubit.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) => UsersCubit(),
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
