import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_list/user_list/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_list/user_list/models/user.dart';

class UsersListService {
  Future<List<User>> getUsersList() async {
    // https://assessment-users-backend.herokuapp.com/users.json
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    final response = await http.get(uri);
    final jsonList = jsonDecode(response.body);
    print(jsonList[0]);

    final _userService = UserService();
    List<User> usersList = [];
    for (var jsonUser in jsonList) {
      final user = await User.fromJson(jsonUser);
      usersList.add(user);
    }
    return usersList;
  }
}
