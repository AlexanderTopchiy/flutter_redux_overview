import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/data/data_repository.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_actions.dart';
import 'package:redux/redux.dart';

class PostMiddleware extends MiddlewareClass<AppState> {
  final DataRepository repository;

  PostMiddleware({
    required this.repository,
  });

  @override
  Future<void> call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async =>
      switch (action) {
        FetchPostListAction() => _fetchPostList(next),
        _ => next(action),
      };

  Future<void> _fetchPostList(NextDispatcher next) async {
    next(const FetchingPostListAction());

    try {
      final postList = await repository.fetchPostList();
      next(FetchPostListSuccessAction(postList));
    } catch (_) {
      next(const FetchPostListErrorAction());
    }
  }
}
