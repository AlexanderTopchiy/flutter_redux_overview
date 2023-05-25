import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_overview/features/post/model/post.dart';

@immutable
class PostState extends Equatable {
  final List<Post> postList;

  const PostState({
    required this.postList,
  });

  factory PostState.initial() => const PostState(
        postList: [],
      );

  @override
  List<Object?> get props => [
        postList,
      ];

  PostState copyWith({
    List<Post>? postList,
  }) =>
      PostState(
        postList: postList ?? this.postList,
      );
}
