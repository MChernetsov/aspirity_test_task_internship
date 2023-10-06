import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship/application/view_post/view_post_bloc.dart';
import 'package:internship/presentation/pages/post_page/comment_tile.dart';
import 'package:internship/presentation/pages/post_page/full_post.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      builder: (context, state) {
        return state.map(
          initial: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (e) {
            return ListView.builder(
              itemBuilder: (context, index) => index == 0
                  ? FullPost(
                      post: e.post,
                      user: e.user,
                    )
                  : CommentTile(
                      comment: e.comments[index - 1],
                    ),
              itemCount: e.comments.length + 1,
            );
          },
          failure: (_) {
            return Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                ),
                onPressed: () => context.read<ViewPostBloc>().add(
                      ViewPostEvent.started(
                        id: id,
                      ),
                    ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
