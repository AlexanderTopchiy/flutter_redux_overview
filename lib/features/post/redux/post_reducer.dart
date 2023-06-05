import 'package:flutter_redux_overview/features/common/model/loading_status.dart';
import 'package:flutter_redux_overview/features/post/redux/post_actions.dart';
import 'package:flutter_redux_overview/features/post/redux/post_state.dart';

PostState postReducer(
  PostState state,
  dynamic action,
) =>
    switch (action) {
      FetchingPostListAction() => state.copyWith(
          status: LoadingStatus.loading,
        ),
      FetchPostListSuccessAction(postList: var postList) => state.copyWith(
          status: LoadingStatus.success,
          postList: postList,
        ),
      FetchPostListErrorAction() => state.copyWith(
          status: LoadingStatus.error,
        ),
      _ => state,
    };
