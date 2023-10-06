import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internship/presentation/pages/home_page/home_page.dart';
import 'package:internship/presentation/pages/post_page/post_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: PostRoute.page),
      ];
}
