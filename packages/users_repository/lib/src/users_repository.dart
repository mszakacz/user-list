import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:users_repository/const/enums.dart';
import 'package:users_api/users_api.dart';

class UsersRepository {
  const UsersRepository({required this.usersApiClient});

  final UsersApiClient usersApiClient;

  Future<User> getUser(int id) async {
    return await usersApiClient.getUser(id);
  }

  Future<void> deleteUser(int id) async {
    return await usersApiClient.deleteUser(id);
  }

  Future<void> postUser(String firstname, String lastname) async {
    await usersApiClient.postUser(firstname, lastname);
  }

  Future<void> updateUser(User user) async {
    await usersApiClient.updateUser(user);
  }

  Future<List<User>> getUsersList() async {
    return await usersApiClient.getUsersList();
  }

  Future<List<User>> sortList(List<User> usersList, SortingBy sortingBy) async {
    switch (sortingBy) {
      case SortingBy.creationTimeDescending:
        usersList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        return usersList;
      case SortingBy.creationTimeAscending:
        usersList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return usersList;
      case SortingBy.idDescending:
        usersList.sort((a, b) => b.id.compareTo(a.id));
        return usersList;
      case SortingBy.idAscending:
        usersList.sort((a, b) => a.id.compareTo(b.id));
        return usersList;
      case SortingBy.updateTimeDescending:
        usersList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        return usersList;
      case SortingBy.updateTimeAscending:
        usersList.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
        return usersList;
      case SortingBy.firstnameDescending:
        usersList.sort((a, b) =>
            b.firstname.toLowerCase().compareTo(a.firstname.toLowerCase()));
        return usersList;
      case SortingBy.firstnameAscending:
        usersList.sort((a, b) =>
            a.firstname.toLowerCase().compareTo(b.firstname.toLowerCase()));
        return usersList;
      case SortingBy.lastnameDescending:
        usersList.sort((a, b) =>
            b.lastname.toLowerCase().compareTo(a.lastname.toLowerCase()));
        return usersList;
      case SortingBy.lastnameAscending:
        usersList.sort((a, b) =>
            a.lastname.toLowerCase().compareTo(b.lastname.toLowerCase()));
        return usersList;
    }
  }
}
