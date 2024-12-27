import 'package:auto_route/auto_route.dart';
import 'package:introvertdiaries/src/core/routes/app_router.gr.dart';
import 'package:introvertdiaries/src/core/routes/app_routes.dart';

export 'app_router.gr.dart';
export 'app_routes.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: AppRoutes.splashPage,
      initial: true,
    ),

    AutoRoute(
      page: LoginRoute.page,
      path: AppRoutes.loginPage,
    ),

    AutoRoute(page: HomeRoute.page,
    path: AppRoutes.homePage,),
  ];
}
