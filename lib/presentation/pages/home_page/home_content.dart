import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship/application/posts/posts_bloc.dart';
import 'package:internship/presentation/pages/home_page/post_card.dart';
import 'package:internship/presentation/routing/router.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (e) {
            return ListView.separated(
              itemCount: e.posts.length,
              itemBuilder: (context, index) => PostCard(
                onTap: () => context.router.push(
                  PostRoute(
                    id: e.posts[index].id,
                  ),
                ),
                post: e.posts[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
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
                onPressed: () => context.read<PostsBloc>().add(
                      const PostsEvent.started(),
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
