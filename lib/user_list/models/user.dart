import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UserService {
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

  // void createNewUser(String name, String lastname) async {
  //   final uri = Uri.https('assessment-users-backend.herokuapp.com',
  //       '/users/${id.toString()}.json');
  //   await http.post(uri, {
  //     null,
  //   });
  // }

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
}

class User {
  // {"id":44,"last_name":"Swift","first_name":"Jasen","status":"active","created_at":"2022-01-04T16:00:48.304Z","updated_at":"2022-01-05T14:26:10.961Z"}
  final int id;
  final String lastname;
  final String firstname;
  final String status;
  final String updatedAt;
  final String url;
  final String createdAt;

  const User({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    int id = data['id'];
    String lastname = data['last_name'];
    String firstname = data['first_name'];
    String status = data['status'];
    String createdAt = data['created_at'];
    String updatedAt = data['updated_at'];

    User user = User(
      id: id,
      lastname: lastname,
      firstname: firstname,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      url:
          'https://assessment-users-backend.herokuapp.com/users/${id.toString()}.json',
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_name": lastname,
        "first_name": firstname,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// class NewUser extends User {
//   int id;
//   String lastname;
//   String firstname;
//   String status;
//   String createdAt;
//   String updatedAt;
//   String url;

//   NewUser({
//     required this.id,
//     required this.lastname,
//     required this.firstname,
//     required this.status,
//     this.createdAt = '',
//     this.updatedAt = '',
//     this.url = '',
//   });

