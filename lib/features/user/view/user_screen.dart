import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
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
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(),
          body: RefreshIndicator(
            onRefresh: () async => vm.onRefresh(),
            child: UserList(userList: vm.userList),
          ),
        );
      },
    );
  }
}
