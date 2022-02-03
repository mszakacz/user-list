import 'package:flutter/material.dart';

class UserPropertyNameWidget extends StatelessWidget {
  final String text;
  const UserPropertyNameWidget({
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
          color: Colors.grey[900],
          fontSize: 18,
        ),
      ),
    );
  }
}
