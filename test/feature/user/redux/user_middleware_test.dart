import 'package:flutter_redux_overview/data/network_exception.dart';
import 'package:flutter_redux_overview/feature/user/model/user.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_middleware.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('UserMiddleware -', () {
    final actionLog = [];
    next(action) => actionLog.add(action);

    const userList = [
      User(
        id: 0,
        name: 'first',
      ),
      User(
        id: 1,
        name: 'second',
      ),
    ];

    late final MockStore store;
    late final MockDataRepository repository;
    late final UserMiddleware middleware;

    setUpAll(() {
      store = MockStore();
      repository = MockDataRepository();
      middleware = UserMiddleware(repository: repository);
    });

    tearDown(actionLog.clear);

    test(
        'when called with FetchUserListAction, should dispatch '
        'FetchUserListSuccessAction with fetched user list', () async {
      // GIVEN
      when(repository.fetchUserList).thenAnswer((_) async => userList);

      // WHEN
      await middleware.call(
        store,
        const FetchUserListAction(),
        next,
      );

      // THEN
      verify(repository.fetchUserList).called(1);

      expect(actionLog.length, 2);
      expect(actionLog[0], const TypeMatcher<FetchingUserListAction>());
      expect(actionLog[1], const TypeMatcher<FetchUserListSuccessAction>());

      final action = actionLog[1] as FetchUserListSuccessAction;
      expect(action.userList, userList);
    });

    test(
        'when FetchUserListAction result is error, should dispatch '
        'FetchUserListErrorAction', () async {
      // GIVEN
      when(repository.fetchUserList).thenThrow(const NetworkException());

      // WHEN
      await middleware.call(
        store,
        const FetchUserListAction(),
        next,
      );

      // THEN
      verify(repository.fetchUserList).called(1);

      expect(actionLog.length, 2);
      expect(actionLog[0], const TypeMatcher<FetchingUserListAction>());
      expect(actionLog[1], const TypeMatcher<FetchUserListErrorAction>());
    });
  });
}
