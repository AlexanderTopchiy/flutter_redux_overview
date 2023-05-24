import 'package:flutter_redux_overview/features/users/get_users_list_action.dart';
import 'package:flutter_redux_overview/features/users/user.dart';

class UsersReducers {
  const UsersReducers();

  List<User> getUsersList(
    List<User> usersList,
    GetUsersListAction action,
  ) =>
      List.from(usersList)
        ..followedBy(
          const [
            User(id: 0, name: 'The Zero'),
            User(id: 1, name: 'The One'),
            User(id: 2, name: 'The Two'),
            User(id: 3, name: 'The Three'),
          ],
        );
}
