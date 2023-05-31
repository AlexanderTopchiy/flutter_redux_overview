import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/data/data_repository.dart';
import 'package:flutter_redux_overview/features/user/redux/user_actions.dart';
import 'package:redux/redux.dart';

class UserMiddleware extends MiddlewareClass<AppState> {
  final DataRepository repository;

  UserMiddleware({
    required this.repository,
  });

  @override
  Future<void> call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async =>
      switch (action) {
        FetchUserListAction() => _fetchUserList(next),
        _ => next(action),
      };

  Future<void> _fetchUserList(NextDispatcher next) async {
    next(const FetchingUserListAction());

    try {
      final userList = await repository.fetchUserList();
      next(FetchUserListSuccessAction(userList));
    } catch (_) {
      next(const FetchUserListErrorAction());
    }
  }
}
