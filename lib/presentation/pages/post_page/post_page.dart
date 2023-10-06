import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship/application/view_post/view_post_bloc.dart';
import 'package:internship/injection.dart';
import 'package:internship/presentation/pages/post_page/post_content.dart';

@RoutePage()
class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Poster',
        ),
      ),
      body: BlocProvider(
        create: (_) => getIt<ViewPostBloc>()
          ..add(
            ViewPostEvent.started(id: id),
          ),
        child: PostContent(
          id: id,
        ),
      ),
    );
  }
}
