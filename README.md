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
App that displays the list of users. It communicates with REST API. App allows user to view the list of users, view, create, edit, activate, lock or delete user. Main list can be sorted by created time, id, name or last name. You can update users first and last name. App uses Loading Indicators and SnackBars to make user experience smoother. Application is divided into Presentation Layout (UI and BLoC), Business Layer (UsersRepository package), Data Layer (UsersApiClient package). Code is written in the high standards way to make it easy to maintain and easy to test. Project also contains BLoC tests, unit tests, widget tests.

### Key technologies:
BLoC, REST API, widget tests, unit tests, Http