import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_overview/feature/common/model/loading_status.dart';
import 'package:flutter_redux_overview/data/model/post.dart';

@immutable
class PostState extends Equatable {
  final LoadingStatus status;
  final List<Post> postList;

  const PostState({
    required this.status,
    required this.postList,
  });

  factory PostState.initial() => const PostState(
        status: LoadingStatus.idle,
        postList: [],
      );

  @override
  List<Object?> get props => [
        status,
        postList,
      ];

  PostState copyWith({
    LoadingStatus? status,
    List<Post>? postList,
  }) =>
      PostState(
        status: status ?? this.status,
        postList: postList ?? this.postList,
      );
}
