import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';
import 'user_repository.dart';
import 'package:path_provider/path_provider.dart';

class UsersListRepository {
  Future<List<User>> getUsersList() async {
    // https://assessment-users-backend.herokuapp.com/users.json
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    final response = await http.get(uri);
    final jsonList = jsonDecode(response.body);

    List<User> usersList = [];
    for (var jsonUser in jsonList) {
      final user = await User.fromJson(jsonUser);
      usersList.add(user);
    }
    return usersList;
  }
}
