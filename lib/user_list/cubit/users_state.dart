part of 'users_cubit.dart';

const List<User> list = [
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

class UsersState {
  List<User> lastAvailableList;
  bool isUpToDate;

  UsersState({
    required this.lastAvailableList,
    required this.isUpToDate,
  });
}

class UsersInitialState {
  // List<User> list = [
  //   User(
  //     id: 1,
  //     lastname: "Lenon",
  //     firstname: "Maciej",
  //     status: "active",
  //     createdAt: "1313",
  //     updatedAt: "121",
  //     url: "sad",
  //   ),
  //   User(
  //     id: 2,
  //     lastname: "O'Sullivan",
  //     firstname: "Ronnie",
  //     status: "active",
  //     createdAt: "1313",
  //     updatedAt: "121",
  //     url: "sad",
  //   ),
  //   User(
  //     id: 3,
  //     lastname: "Paul",
  //     firstname: "Chris",
  //     status: "active",
  //     createdAt: "1313",
  //     updatedAt: "121",
  //     url: "sad",
  //   ),
  //   User(
  //     id: 4,
  //     lastname: "Curry",
  //     firstname: "Stephen",
  //     status: "active",
  //     createdAt: "1313",
  //     updatedAt: "121",
  //     url: "sad",
  //   ),
  //   User(
  //     id: 5,
  //     lastname: "Durant",
  //     firstname: "Kevin",
  //     status: "active",
  //     createdAt: "1313",
  //     updatedAt: "121",
  //     url: "sad",
  //   )
  // ];

  final List<User> lastAvailableList;
  final bool isUpToDate;

  const UsersInitialState({
    this.lastAvailableList = list,
    required this.isUpToDate,
  });
}

class UsersListState extends UsersState {
  UsersListState({
    required lastAvailableList,
    required isUpToDate,
  }) : super(
          lastAvailableList: lastAvailableList,
          isUpToDate: isUpToDate,
        );
}

class WaitingForDataState extends UsersState {
  WaitingForDataState({
    required lastAvailableList,
    required isUpToDate,
  }) : super(
          lastAvailableList: lastAvailableList,
          isUpToDate: isUpToDate,
        );
}
