import 'package:flutter/material.dart';
import 'package:user_list/user_list/cubit/users_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: Text('Here we have to implement Settings'),
      ),
    );
  }
}
