import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/user_list/user_list.dart';
import 'package:users_repository/users_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

class MockUsersBloc extends Mock implements UsersBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    UsersRepository? usersRepository,
    UsersBloc? usersBloc,
  }) {
    return pumpWidget(
      RepositoryProvider<UsersRepository>.value(
        value: usersRepository ?? MockUsersRepository(),
        child: BlocProvider<UsersBloc>.value(
          value: usersBloc ?? MockUsersBloc(),
          child: MaterialApp(
            title: 'User List',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: widget,
          ),
        ),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    UsersRepository? usersRepository,
  }) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
      usersRepository: usersRepository,
    );
  }
}
