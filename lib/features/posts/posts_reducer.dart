import 'package:flutter_redux_overview/features/posts/get_posts_list_action.dart';
import 'package:flutter_redux_overview/features/posts/post.dart';

class PostsReducers {
  const PostsReducers();

  List<Post> getPostsList(
    List<Post> postsList,
    GetPostsListAction action,
  ) =>
      List.from(postsList)
        ..followedBy(
          const [
            Post(id: 0, text: 'The zero post'),
            Post(id: 1, text: 'The first post'),
            Post(id: 2, text: 'The second post'),
          ],
        );
}
