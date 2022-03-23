# user_list

[Link to the App](https://user-list-6e123.web.app/#/)

[Link to the Repository](https://github.com/mszakacz/user-list)

### App functionalities:
Mobile App presents the List of Users. 

**Functionalities:**
- get users list from data base and present it
- sort the list of users by creation time, update time, id, name, lastname
- create a new user
- edit the user
- lock/activate the user

### Project Description:
App displays the List of users. It’s connected with external data base and communicates with API. App allows the User to view the list of users, view the specific user, activate or lock the specific user, delete the specific user, sort the list of users (by created time, id, name or last name), create a new user or edit the user’s properties like name or last name. App always return some information to the UI to make user know in what state app is working (SnackBars, Loading indicators, …). App uses BLoC state management. Application is divided into Presentation Layout (UI and BLoC), Business Layer (UsersRepository package), Data Layer (UsersApiClient package). Code is divided into specific functionalities and responsibilities. Code is written in the high standards way to make it easy to maintain and easy to test. Tests for every file are provided (BLoC tests, unit tests, widget tests).

### Key technologies:
BLoC, REST API, widget tests, unit tests, Http