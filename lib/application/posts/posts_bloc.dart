import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internship/domain/post.dart';
import 'package:internship/infrastructure/service/rest_client.dart';

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final RestClient client;
  PostsBloc(this.client) : super(const PostsState.initial()) {
    on<PostsEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          emit(
            const PostsState.initial(),
          );
          await client.getPosts().then(
            (value) => emit(
              PostsState.loaded(posts: value),
            ),
            onError: (e) {
              emit(
                const PostsState.failure(),
              );
            },
          );
        },
      );
    });
  }
}
