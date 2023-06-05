import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_state.dart';

UserState userReducer(
  UserState state,
  dynamic action,
) =>
    switch (action) {
      FetchingUserListAction() => state.copyWith(
          status: LoadingStatus.loading,
        ),
      FetchUserListSuccessAction(userList: var userList) => state.copyWith(
          status: LoadingStatus.success,
          userList: userList,
        ),
      FetchUserListErrorAction() => state.copyWith(
          status: LoadingStatus.error,
        ),
      _ => state,
    };
