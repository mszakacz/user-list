import 'package:flutter/material.dart';
import 'package:user_list/user_list/widgets/sorting_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: SortingSettingsWidget(),
      ),
    );
  }
}
