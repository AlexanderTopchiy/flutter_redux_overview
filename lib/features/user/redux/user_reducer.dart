import 'package:flutter_redux_overview/features/user/model/user.dart';
import 'package:flutter_redux_overview/features/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/features/user/redux/user_state.dart';

UserState userReducer(
  UserState state,
  dynamic action,
) =>
    switch (action) {
      GetUserListAction() => _getUserList(state),
      _ => state,
    };

UserState _getUserList(UserState state) => state.copyWith(
      userList: const [
        User(id: 0, name: 'The Zero'),
        User(id: 1, name: 'The One'),
        User(id: 2, name: 'The Two'),
        User(id: 3, name: 'The Three'),
      ],
    );
