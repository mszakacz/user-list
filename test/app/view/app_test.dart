// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/app/app.dart';
import 'package:user_list/theme/theme.dart';
import 'package:user_list/user_list/user_list.dart';
import 'package:users_repository/users_repository.dart';
import '../../helpers/helpers.dart';

void main() {
  late UsersRepository usersRepository;

  setUp(() {
    usersRepository = MockUsersRepository();
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(usersRepository: usersRepository),
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders MaterialApp with correct themes', (tester) async {
      await tester.pumpWidget(
        App(usersRepository: usersRepository),
      );

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(UserListTheme.light));
      // expect(materialApp.darkTheme, equals(UserListTheme.dark));
    });

    testWidgets('renders UsersPage', (tester) async {
      await tester.pumpWidget(
        App(usersRepository: usersRepository),
      );

      expect(find.byType(UsersPage), findsOneWidget);
    });
  });
}
