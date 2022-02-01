import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_list/user.dart';
import 'package:path_provider/path_provider.dart';

class UsersList {
  Future<List> getUsersList() async {
    // https://assessment-users-backend.herokuapp.com/users.json
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    final list = jsonDecode(response.body);
    return list;
  }

  void printUpdatedList() async {
    final _userService = UserService();
    // final user = await _userService.getUser(45);
    final _usersList = UsersList();
    final list = await _usersList.getUsersList();
    // print(list);

    for (int i = 0; i < 2; i++) {
      var jsonUser = list[i];
      print(jsonUser);
      final user = await User.fromJson(jsonUser);
      print(user.firstname);
    }
  }
}
