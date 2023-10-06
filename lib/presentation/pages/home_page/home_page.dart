import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship/application/posts/posts_bloc.dart';
import 'package:internship/injection.dart';
import 'package:internship/presentation/pages/home_page/home_content.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        create: (_) => getIt<PostsBloc>()
          ..add(
            const PostsEvent.started(),
          ),
        child: const HomeContent(),
      ),
    );
  }
}
