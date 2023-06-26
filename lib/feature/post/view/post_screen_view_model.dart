import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/post.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_actions.dart';
import 'package:redux/redux.dart';

class PostScreenViewModel extends Equatable {
  final LoadingStatus status;
  final List<Post> postList;
  final VoidCallback onRefresh;

  const PostScreenViewModel({
    required this.status,
    required this.postList,
    required this.onRefresh,
  });

  static PostScreenViewModel fromStore(Store<AppState> store) => PostScreenViewModel(
        status: store.state.postState.status,
        postList: store.state.postState.postList,
        onRefresh: () => store.dispatch(const FetchPostListAction()),
      );

  @override
  List<Object?> get props => [
        status,
        postList,
      ];
}
