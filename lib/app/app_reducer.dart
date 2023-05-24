import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/features/posts/posts_reducer.dart';
import 'package:flutter_redux_overview/features/users/users_reducers.dart';

class AppReducer {
  final UsersReducers usersReducers;
  final PostsReducers postsReducers;

  const AppReducer({
    required this.usersReducers,
    required this.postsReducers,
  });

  AppState appStateReducer(AppState state, action) => AppState(
        usersList: usersReducers.getUsersList(state.usersList, action),
        postsList: postsReducers.getPostsList(state.postsList, action),
      );
}
