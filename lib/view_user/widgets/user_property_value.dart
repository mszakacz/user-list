import 'package:flutter/material.dart';

class UserPropertyValueWidget extends StatelessWidget {
  final String text;
  const UserPropertyValueWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue[800],
          fontSize: 18,
        ),
      ),
    );
  }
}
