import 'package:auto_route/auto_route.dart'; // Добавьте этот импорт
import 'package:injectable/injectable.dart';
import 'package:photo_app/presentation/screens/login_screen.dart';
import 'package:photo_app/presentation/screens/main_screen.dart';
import 'package:photo_app/presentation/screens/splash_screen.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: MainRoute.page),
      ];
}
