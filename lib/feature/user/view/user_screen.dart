import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/feature/common/component/card_list.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/feature/user/model/user.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/feature/user/view/user_screen_view_model.dart';
import 'package:flutter_redux_overview/generated/l10n.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserScreenViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(const FetchUserListAction()),
      converter: (store) => UserScreenViewModel.fromStore(store),
      builder: (context, viewModel) => _UserScreenContent(viewModel: viewModel),
    );
  }
}

class _UserScreenContent extends StatelessWidget {
  final UserScreenViewModel viewModel;

  const _UserScreenContent({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.users),
      ),
      body: RefreshIndicator(
        onRefresh: () async => viewModel.onRefresh(),
        child: switch (viewModel.status) {
          LoadingStatus.idle || LoadingStatus.loading => const Center(child: CircularProgressIndicator()),
          LoadingStatus.success => CardList<User>(itemList: viewModel.userList),
          LoadingStatus.error => Text(S.current.networkError),
        },
      ),
    );
  }
}
