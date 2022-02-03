import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${user.id}', style: TextTheme.caption),
        title: Text('${user.firstname} ${user.lastname}'),
        onTap: () => Navigator.of(context).pushNamed('/view', arguments: user),
      ),
    );
  }
}
