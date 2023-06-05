import 'package:flutter_redux_overview/features/post/model/post.dart';

class FetchPostListAction {
  const FetchPostListAction();
}

class FetchingPostListAction {
  const FetchingPostListAction();
}

class FetchPostListSuccessAction {
  final List<Post> postList;
  const FetchPostListSuccessAction(this.postList);
}

class FetchPostListErrorAction {
  const FetchPostListErrorAction();
}
