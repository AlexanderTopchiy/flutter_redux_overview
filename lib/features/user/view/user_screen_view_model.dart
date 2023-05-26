import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/features/user/model/user.dart';
import 'package:flutter_redux_overview/features/user/redux/user_actions.dart';
import 'package:redux/redux.dart';

class UserScreenViewModel extends Equatable {
  final List<User> userList;
  final VoidCallback onRefresh;

  const UserScreenViewModel({
    required this.userList,
    required this.onRefresh,
  });

  static UserScreenViewModel fromStore(Store<AppState> store) => UserScreenViewModel(
        userList: store.state.userState.userList,
        onRefresh: () => store.dispatch(const FetchUserListAction()),
      );

  @override
  List<Object?> get props => [
        userList,
      ];
}