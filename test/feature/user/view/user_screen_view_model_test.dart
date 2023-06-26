import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/user.dart';
import 'package:flutter_redux_overview/feature/user/view/user_screen_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserScreenViewModel -', () {
    test('equal', () {
      final first = UserScreenViewModel(
        status: LoadingStatus.success,
        userList: const [
          User(id: 0, name: 'test'),
        ],
        onRefresh: () {},
      );

      final second = UserScreenViewModel(
        status: LoadingStatus.success,
        userList: const [
          User(id: 0, name: 'test'),
        ],
        onRefresh: () {},
      );

      expect(first, second);
    });

    test('not equal', () {
      final first = UserScreenViewModel(
        status: LoadingStatus.success,
        userList: const [
          User(id: 0, name: 'first'),
        ],
        onRefresh: () {},
      );

      final second = UserScreenViewModel(
        status: LoadingStatus.success,
        userList: const [
          User(id: 1, name: 'second'),
        ],
        onRefresh: () {},
      );

      expect(first, isNot(second));
    });
  });
}
