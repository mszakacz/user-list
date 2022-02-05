import 'package:flutter/material.dart';
import 'package:user_list/user_list/view/view.dart';
import 'package:user_list/edit_user/view/view.dart';
import 'package:user_list/view_user/view/view.dart';
import 'package:user_repository/user_repository.dart';
import 'package:user_list/new_user/view/view.dart';

class AppRouter {
  Route? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const UsersPage(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case '/new':
        return MaterialPageRoute(
          builder: (_) => NewUserPage(),
        );
      case '/edit':
        return MaterialPageRoute(
          builder: (_) => const EditPage(),
        );
      case '/view':
        return MaterialPageRoute(
          builder: (_) {
            final User user = settings.arguments as User;
            return ViewUserPage(user: user);
          },
        );
      default:
        return null;
    }
  }
}
