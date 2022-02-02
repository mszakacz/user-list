import 'package:flutter/material.dart';
import 'package:user_list/user_list/view/view.dart';

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
      case '/add':
        return MaterialPageRoute(
          builder: (_) => const EditPage(),
        );
      case '/edit':
        return MaterialPageRoute(
          builder: (_) => const EditPage(),
        );
      default:
        return null;
    }
  }
}
