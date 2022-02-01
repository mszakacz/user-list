import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Center(
        child: Text('Here we have to implement our List'),
      ),
    );
  }
}
