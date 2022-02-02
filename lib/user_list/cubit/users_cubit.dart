import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_list/user_list/models/models.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
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

  final _usersList = UsersListService();

  void refreshList() async {
    emit(WaitingForDataState(
        lastAvailableList: state.lastAvailableList,
        isUpToDate: state.isUpToDate));

    List<User> users = await _usersList.getUsersList();
    final newState = state.copyWith(lastAvailableList: users);
    emit(newState);
  }

  // try {
  //   List<User> users = await _usersList.getUsersList();
  //   print(users);
  //   emit(UsersState(
  //     lastAvailableList: users,
  //     isUpToDate: true,
  //   ));
  // } catch (e) {
  //   emit(UsersState(
  //     lastAvailableList: state.lastAvailableList,
  //     isUpToDate: false,
  //   ));
  // }
}
