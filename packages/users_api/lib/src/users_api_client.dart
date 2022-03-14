import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/models.dart';

/// Exception thrown when getUser method fails.
class GetUserRequestFailure implements Exception {}

/// Exception thrown when user json deserialization fails.
class UserDeserializationFailure implements Exception {}

/// Exception thrown when deleteUser method fails.
class DeleteUserRequestFailure implements Exception {}

/// Exception thrown when postUser method fails.
class PostUserRequestFailure implements Exception {}

/// Exception thrown when updateUser method fails.
class UpdateUserRequestFailure implements Exception {}

/// Exception thrown when users list json deserialization fails.
class UsersListDeserializationFailure implements Exception {}

/// Exception thrown when getUsersList method fails.
class GetUsersListRequestFailure implements Exception {}

class UsersApiClient {
  Future<User> getUser(int id) async {
    // https://assessment-users-backend.herokuapp.com/users/56.json
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw GetUserRequestFailure();
    }
    try {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } catch (_) {
      throw UserDeserializationFailure();
    }
  }

  Future<void> deleteUser(int id) async {
    final uri = Uri.https('assessment-users-backend.herokuapp.com',
        '/users/${id.toString()}.json');
    final response = await http.delete(uri);
    if (response.statusCode != 200) {
      throw DeleteUserRequestFailure();
    }
  }

  Future<void> postUser(User user) async {
    final uri =
        Uri.https('assessment-users-backend.herokuapp.com', '/users.json');

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode != 200) {
      throw PostUserRequestFailure();
    }
  }

  Future<void> updateUser(User user) async {
    int id = user.id;
    final uri = Uri.https(
      'assessment-users-backend.herokuapp.com',
      '/users/${id.toString()}.json',
    );
    final response = await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode != 200) {
      throw UpdateUserRequestFailure();
    }
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
    if (response.statusCode != 200) {
      GetUsersListRequestFailure();
    }
    try {
      final jsonList = jsonDecode(response.body);
      List<User> usersList = [];
      for (var jsonUser in jsonList) {
        final user = User.fromJson(jsonUser);
        usersList.add(user);
      }
      return usersList;
    } catch (_) {
      throw UsersListDeserializationFailure();
    }
  }
}
