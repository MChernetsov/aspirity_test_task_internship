import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internship/domain/comment.dart';
import 'package:internship/domain/post.dart';
import 'package:internship/domain/user.dart';
import 'package:internship/infrastructure/service/rest_client.dart';

part 'view_post_event.dart';
part 'view_post_state.dart';
part 'view_post_bloc.freezed.dart';

@injectable
class ViewPostBloc extends Bloc<ViewPostEvent, ViewPostState> {
  final RestClient client;
  ViewPostBloc(this.client) : super(const ViewPostState.initial()) {
    on<ViewPostEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(
            const ViewPostState.initial(),
          );
          try {
            final post = await client.getPost(e.id);
            final comments = await client.getComments(e.id);
            final users = await client.getUser();
            emit(
              ViewPostState.loaded(
                post: post,
                user: users.firstWhere(
                  (element) => element.id == post.userId,
                ),
                comments: comments,
              ),
            );
          } catch (e) {
            emit(
              const ViewPostState.failure(),
            );
          }
        },
      );
    });
  }
}
