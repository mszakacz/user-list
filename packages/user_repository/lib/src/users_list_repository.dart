import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';
import 'package:user_repository/const/enums.dart';

class UsersListRepository {
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
      default:
        return usersList;
    }
  }
}
