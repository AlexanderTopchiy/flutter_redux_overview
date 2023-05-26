import 'package:flutter_redux_overview/features/user/model/user.dart';
import 'package:flutter_redux_overview/features/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/features/user/redux/user_state.dart';

UserState userReducer(
  UserState state,
  dynamic action,
) =>
    switch (action) {
      FetchUserListAction() => _fetchUserList(state),
      _ => state,
    };

UserState _fetchUserList(UserState state) => state.copyWith(
      userList: const [
        User(id: 0, name: 'The Zero'),
        User(id: 1, name: 'The One'),
        User(id: 2, name: 'The Two'),
        User(id: 3, name: 'The Three'),
      ],
    );
