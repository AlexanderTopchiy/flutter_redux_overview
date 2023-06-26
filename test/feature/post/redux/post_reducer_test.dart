import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/post.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_actions.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_reducer.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostReducer -', () {
    test(
        'when called with FetchingPostListAction, should dispatch '
        'post state with loading status', () {
      final reducerState = postReducer(
        PostState.initial(),
        const FetchingPostListAction(),
      );

      expect(reducerState.status, LoadingStatus.loading);
    });

    test(
        'when called with FetchPostListSuccessAction, should dispatch '
        'post state with success status and post list', () {
      const postList = <Post>[
        Post(
          id: 0,
          title: 'first',
          body: 'body',
        ),
        Post(
          id: 1,
          title: 'second',
          body: 'body',
        ),
      ];
      final reducerState = postReducer(
        PostState.initial(),
        const FetchPostListSuccessAction(postList),
      );

      expect(reducerState.status, LoadingStatus.success);
      expect(reducerState.postList, postList);
    });

    test(
        'when called with FetchPostListErrorAction, should dispatch '
        'post state with error status', () {
      final reducerState = postReducer(
        PostState.initial(),
        const FetchPostListErrorAction(),
      );

      expect(reducerState.status, LoadingStatus.error);
    });
  });
}
