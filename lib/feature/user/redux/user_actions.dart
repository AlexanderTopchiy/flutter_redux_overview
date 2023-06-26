import 'package:flutter_redux_overview/data/model/user.dart';

class FetchUserListAction {
  const FetchUserListAction();
}

class FetchingUserListAction {
  const FetchingUserListAction();
}

class FetchUserListSuccessAction {
  final List<User> userList;
  const FetchUserListSuccessAction(this.userList);
}

class FetchUserListErrorAction {
  const FetchUserListErrorAction();
}
