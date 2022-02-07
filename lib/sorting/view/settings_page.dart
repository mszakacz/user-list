import 'package:flutter/material.dart';
import 'package:user_list/sorting/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: const Center(
        child: SortingSettingsWidget(),
      ),
    );
  }
}
