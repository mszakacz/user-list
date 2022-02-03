import 'package:flutter/material.dart';
import 'package:user_list/user_list/models/models.dart';
import 'package:user_list/view_user/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class ViewUserPage extends StatelessWidget {
  final User user;
  const ViewUserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Page'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserPropertyNameWidget(text: 'id:'),
                UserPropertyNameWidget(text: 'Name:'),
                UserPropertyNameWidget(text: 'Lastname:'),
                UserPropertyNameWidget(text: 'Status:'),
                UserPropertyNameWidget(text: 'Created at:'),
                UserPropertyNameWidget(text: 'Updated at:'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserPropertyValueWidget(text: user.id.toString()),
                UserPropertyValueWidget(text: user.firstname),
                UserPropertyValueWidget(text: user.lastname),
                UserPropertyValueWidget(text: user.status),
                UserPropertyValueWidget(text: dateString(user.createdAt)),
                UserPropertyValueWidget(text: dateString(user.updatedAt)),
              ],
            ),
          ],
        ));
  }

  String dateString(String date) {
    return date.substring(0, 10) + '  ' + date.substring(11, 16);
  }
}
