import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/user.dart';

@immutable
class UserState extends Equatable {
  final LoadingStatus status;
  final List<User> userList;

  const UserState({
    required this.status,
    required this.userList,
  });

  factory UserState.initial() => const UserState(
        status: LoadingStatus.idle,
        userList: [],
      );

  @override
  List<Object?> get props => [
        status,
        userList,
      ];

  UserState copyWith({
    LoadingStatus? status,
    List<User>? userList,
  }) =>
      UserState(
        status: status ?? this.status,
        userList: userList ?? this.userList,
      );
}
