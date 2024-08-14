import 'package:auto_route/auto_route.dart'; // Добавьте этот импорт
import 'package:flutter/material.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: MainRoute.page),
      ];
}
