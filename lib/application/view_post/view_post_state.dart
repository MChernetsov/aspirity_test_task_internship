part of 'view_post_bloc.dart';

@freezed
class ViewPostState with _$ViewPostState {
  const factory ViewPostState.initial() = _Initial;
  const factory ViewPostState.loaded({
    required User user,
    required Post post,
    required List<Comment> comments,
  }) = _Loaded;
  const factory ViewPostState.failure() = _Failure;
}
