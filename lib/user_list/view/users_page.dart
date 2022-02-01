import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: false,
        backgroundColor: Colors.grey[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
          )
        ],
      ),
      body: Center(
        child: Text('Here we have to implement our List'),
      ),
    );
  }
}
