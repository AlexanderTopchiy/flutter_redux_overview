import 'package:flutter_redux_overview/features/post/redux/post_actions.dart';
import 'package:flutter_redux_overview/features/post/model/post.dart';
import 'package:flutter_redux_overview/features/post/redux/post_state.dart';

PostState postReducer(
  PostState state,
  dynamic action,
) =>
    switch (action) {
      FetchPostListAction() => _fetchPostList(state),
      _ => state,
    };

PostState _fetchPostList(PostState state) => state.copyWith(
      postList: const [
        Post(id: 0, title: 'The zero post', body: 'Post body'),
        Post(id: 1, title: 'The first post', body: 'Post body'),
        Post(id: 2, title: 'The second post', body: 'Post body'),
      ],
    );
