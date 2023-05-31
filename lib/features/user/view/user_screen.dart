import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/features/common/model/loading_status.dart';
import 'package:flutter_redux_overview/features/user/redux/user_actions.dart';
import 'package:flutter_redux_overview/features/user/view/components/user_list.dart';
import 'package:flutter_redux_overview/features/user/view/user_screen_view_model.dart';

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
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async => viewModel.onRefresh(),
        child: switch (viewModel.status) {
          LoadingStatus.idle || LoadingStatus.loading => const Center(child: CircularProgressIndicator()),
          LoadingStatus.success => UserList(userList: viewModel.userList),
          LoadingStatus.error => const Text('Error while fetching user list'),
        },
      ),
    );
  }
}
