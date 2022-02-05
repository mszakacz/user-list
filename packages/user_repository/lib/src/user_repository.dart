import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

class UserRepository {
  Future<User> getUser(int id) async {
    // https://assessment-users-backend.herokuapp.com/users/56.json
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    return User.fromJson(data);
  }

  void deleteUser(int id) async {
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    await http.delete(uri);
  }

  void postUser(User user) async {
    int id = user.id;
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');
    await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
  }

  void updateUser(int id, User user) async {
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

  User emptyUser() {
    User user = const User(
      id: 0,
      lastname: '',
      firstname: '',
      status: '',
      createdAt: '',
      updatedAt: '',
      url: '',
    );
    return user;
  }

  void createNewUser(String name, String lastname) {}
}
