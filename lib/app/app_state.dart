import 'package:flutter_redux_overview/features/posts/post.dart';
import 'package:flutter_redux_overview/features/users/user.dart';

class AppState {
  final List<User> usersList;
  final List<Post> postsList;

  const AppState({
    this.usersList = const [],
    this.postsList = const [],
  });
}
