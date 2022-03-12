import 'package:flutter/material.dart';

class UserPropertyWidget extends StatelessWidget {
  const UserPropertyWidget({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  name,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 3,
              child: Center(
                child: Text(
                  value,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
