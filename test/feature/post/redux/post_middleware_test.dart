import 'package:flutter_redux_overview/data/network_exception.dart';
import 'package:flutter_redux_overview/data/model/post.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_actions.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_middleware.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('PostMiddleware -', () {
    final actionLog = [];
    next(action) => actionLog.add(action);

    const postList = [
      Post(id: 0, title: 'first', body: 'body'),
      Post(
        id: 1,
        title: 'second',
        body: 'body',
      ),
    ];

    late final MockStore store;
    late final MockDataRepository repository;
    late final PostMiddleware middleware;

    setUpAll(() {
      store = MockStore();
      repository = MockDataRepository();
      middleware = PostMiddleware(repository: repository);
    });

    tearDown(actionLog.clear);

    test(
        'when called with FetchPostListAction, should dispatch '
        'FetchPostListSuccessAction with fetched post list', () async {
      // GIVEN
      when(repository.fetchPostList).thenAnswer((_) async => postList);

      // WHEN
      await middleware.call(
        store,
        const FetchPostListAction(),
        next,
      );

      // THEN
      verify(repository.fetchPostList).called(1);

      expect(actionLog.length, 2);
      expect(actionLog[0], const TypeMatcher<FetchingPostListAction>());
      expect(actionLog[1], const TypeMatcher<FetchPostListSuccessAction>());

      final action = actionLog[1] as FetchPostListSuccessAction;
      expect(action.postList, postList);
    });

    test(
        'when FetchPostListAction result is error, should dispatch '
        'FetchPostListErrorAction', () async {
      // GIVEN
      when(repository.fetchPostList).thenThrow(const NetworkException());

      // WHEN
      await middleware.call(
        store,
        const FetchPostListAction(),
        next,
      );

      // THEN
      verify(repository.fetchPostList).called(1);

      expect(actionLog.length, 2);
      expect(actionLog[0], const TypeMatcher<FetchingPostListAction>());
      expect(actionLog[1], const TypeMatcher<FetchPostListErrorAction>());
    });
  });
}
