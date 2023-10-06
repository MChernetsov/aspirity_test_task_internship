// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PostRoute.name: (routeData) {
      final args = routeData.argsAs<PostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PostPage]
class PostRoute extends PageRouteInfo<PostRouteArgs> {
  PostRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          PostRoute.name,
          args: PostRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static const PageInfo<PostRouteArgs> page = PageInfo<PostRouteArgs>(name);
}

class PostRouteArgs {
  const PostRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'PostRouteArgs{key: $key, id: $id}';
  }
}
