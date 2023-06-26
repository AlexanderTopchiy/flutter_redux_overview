import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/post.dart';
import 'package:flutter_redux_overview/feature/post/view/post_screen_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostScreenViewModel -', () {
    test('equal', () {
      final first = PostScreenViewModel(
        status: LoadingStatus.success,
        postList: const [
          Post(
            id: 0,
            title: 'title',
            body: 'body',
          ),
        ],
        onRefresh: () {},
      );

      final second = PostScreenViewModel(
        status: LoadingStatus.success,
        postList: const [
          Post(
            id: 0,
            title: 'title',
            body: 'body',
          ),
        ],
        onRefresh: () {},
      );

      expect(first, second);
    });

    test('not equal', () {
      final first = PostScreenViewModel(
        status: LoadingStatus.success,
        postList: const [
          Post(
            id: 0,
            title: 'title',
            body: 'body',
          ),
        ],
        onRefresh: () {},
      );

      final second = PostScreenViewModel(
        status: LoadingStatus.success,
        postList: const [
          Post(
            id: 1,
            title: 'not title',
            body: 'not body',
          ),
        ],
        onRefresh: () {},
      );

      expect(first, isNot(second));
    });
  });
}
