import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/models.dart';

class UsersApiClient {
  Future<User> getUser(int id) async {
    // https://assessment-users-backend.herokuapp.com/users/56.json
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    return User.fromJson(data);
  }

  Future<void> deleteUser(int id) async {
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    await http.delete(uri);
  }

  Future<void> postUser(User user) async {
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    // TODO: check the reposonse
    await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
  }

  Future<void> updateUser(User user) async {
    int id = user.id;
    final uri = Uri.https(
      'assessment-users-backend.herokuapp.com',
      '/users/${id.toString()}.json',
    );
    await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
  }

  Future<void> createAndPostNewUser(String name, String lastname) {
    User user = User(
      id: 0, // server automatically sets it
      lastname: lastname,
      firstname: name,
      status: 'active',
      createdAt: '', // server automatically sets it
      updatedAt: '', // server automatically sets it
      url: '', // server automatically sets it
    );
    return postUser(user);
  }

  Future<List<User>> getUsersList() async {
    // https://assessment-users-backend.herokuapp.com/users.json
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    final response = await http.get(uri);
    final jsonList = jsonDecode(response.body);

    List<User> usersList = [];
    for (var jsonUser in jsonList) {
      final user = User.fromJson(jsonUser);
      usersList.add(user);
    }
    return usersList;
  }
}
