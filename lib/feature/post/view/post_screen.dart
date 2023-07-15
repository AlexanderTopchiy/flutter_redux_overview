import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/feature/common/component/card_list.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/post.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_actions.dart';
import 'package:flutter_redux_overview/feature/post/view/post_screen_view_model.dart';
import 'package:flutter_redux_overview/generated/l10n.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PostScreenViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(const FetchPostListAction()),
      converter: (store) => PostScreenViewModel.fromStore(store),
      builder: (context, viewModel) => _PostScreenContent(viewModel: viewModel),
    );
  }
}

class _PostScreenContent extends StatelessWidget {
  final PostScreenViewModel viewModel;

  const _PostScreenContent({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.posts),
      ),
      body: RefreshIndicator(
        onRefresh: () async => viewModel.onRefresh(),
        child: switch (viewModel.status) {
          LoadingStatus.idle || LoadingStatus.loading => const Center(child: CircularProgressIndicator()),
          LoadingStatus.success => CardList<Post>(itemList: viewModel.postList),
          LoadingStatus.error => Center(child: Text(S.current.networkError)),
        },
      ),
    );
  }
}
