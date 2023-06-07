import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_overview/feature/post/redux/post_state.dart';
import 'package:flutter_redux_overview/feature/user/redux/user_state.dart';

@immutable
class AppState extends Equatable {
  final UserState userState;
  final PostState postState;

  const AppState({
    required this.userState,
    required this.postState,
  });

  factory AppState.initial() => AppState(
        userState: UserState.initial(),
        postState: PostState.initial(),
      );

  @override
  List<Object?> get props => [
        userState,
        postState,
      ];

  AppState copyWith({
    UserState? userState,
    PostState? postState,
  }) =>
      AppState(
        userState: userState ?? this.userState,
        postState: postState ?? this.postState,
      );
}
