import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_list/user_list/models/models.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  // User user1 = User(
  //   id: 1,
  //   lastname: "Lenon",
  //   firstname: "Maciej",
  //   status: "active",
  //   createdAt: "1313",
  //   updatedAt: "121",
  //   url: "sad",
  // );
  // User user2 = User(
  //   id: 2,
  //   lastname: "O'Sullivan",
  //   firstname: "Ronnie",
  //   status: "active",
  //   createdAt: "1313",
  //   updatedAt: "121",
  //   url: "sad",
  // );
  // User user3 = User(
  //   id: 3,
  //   lastname: "Paul",
  //   firstname: "Chris",
  //   status: "active",
  //   createdAt: "1313",
  //   updatedAt: "121",
  //   url: "sad",
  // );
  // User user4 = User(
  //   id: 4,
  //   lastname: "Curry",
  //   firstname: "Stephen",
  //   status: "active",
  //   createdAt: "1313",
  //   updatedAt: "121",
  //   url: "sad",
  // );
  // User user5 = User(
  //   id: 5,
  //   lastname: "Durant",
  //   firstname: "Kevin",
  //   status: "active",
  //   createdAt: "1313",
  //   updatedAt: "121",
  //   url: "sad",
  // );

  static List<User> list = [
    User(
      id: 1,
      lastname: "Lenon",
      firstname: "Maciej",
      status: "active",
      createdAt: "1313",
      updatedAt: "121",
      url: "sad",
    ),
    User(
      id: 2,
      lastname: "O'Sullivan",
      firstname: "Ronnie",
      status: "active",
      createdAt: "1313",
      updatedAt: "121",
      url: "sad",
    ),
    User(
      id: 3,
      lastname: "Paul",
      firstname: "Chris",
      status: "active",
      createdAt: "1313",
      updatedAt: "121",
      url: "sad",
    ),
    User(
      id: 4,
      lastname: "Curry",
      firstname: "Stephen",
      status: "active",
      createdAt: "1313",
      updatedAt: "121",
      url: "sad",
    ),
    User(
      id: 5,
      lastname: "Durant",
      firstname: "Kevin",
      status: "active",
      createdAt: "1313",
      updatedAt: "121",
      url: "sad",
    )
  ];

  UsersCubit()
      : super(UsersState(
          lastAvailableList: list,
          isUpToDate: true,
        ));
}
