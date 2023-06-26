import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/user.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_reducer.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserReducer -', () {
    test(
        'when called with FetchingUserListAction, should dispatch '
        'user state with loading status', () {
      final reducerState = userReducer(
        UserState.initial(),
        const FetchingUserListAction(),
      );

      expect(reducerState.status, LoadingStatus.loading);
    });

    test(
        'when called with FetchUserListSuccessAction, should dispatch '
        'user state with success status and user list', () {
      const userList = <User>[
        User(id: 0, name: 'first'),
        User(id: 1, name: 'second'),
      ];
      final reducerState = userReducer(
        UserState.initial(),
        const FetchUserListSuccessAction(userList),
      );

      expect(reducerState.status, LoadingStatus.success);
      expect(reducerState.userList, userList);
    });

    test(
        'when called with FetchUserListErrorAction, should dispatch '
        'user state with error status', () {
      final reducerState = userReducer(
        UserState.initial(),
        const FetchUserListErrorAction(),
      );

      expect(reducerState.status, LoadingStatus.error);
    });
  });
}
