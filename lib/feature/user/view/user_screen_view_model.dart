import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/user.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_actions.dart';
import 'package:redux/redux.dart';

class UserScreenViewModel extends Equatable {
  final LoadingStatus status;
  final List<User> userList;
  final VoidCallback onRefresh;

  const UserScreenViewModel({
    required this.status,
    required this.userList,
    required this.onRefresh,
  });

  static UserScreenViewModel fromStore(Store<AppState> store) => UserScreenViewModel(
        status: store.state.userState.status,
        userList: store.state.userState.userList,
        onRefresh: () => store.dispatch(const FetchUserListAction()),
      );

  @override
  List<Object?> get props => [
        status,
        userList,
      ];
}
