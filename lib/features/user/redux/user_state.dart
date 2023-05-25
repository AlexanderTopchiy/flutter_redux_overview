import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_overview/features/user/model/user.dart';

@immutable
class UserState extends Equatable {
  final List<User> userList;

  const UserState({
    required this.userList,
  });

  factory UserState.initial() => const UserState(
        userList: [],
      );

  @override
  List<Object?> get props => [
        userList,
      ];

  UserState copyWith({
    List<User>? userList,
  }) =>
      UserState(
        userList: userList ?? this.userList,
      );
}
