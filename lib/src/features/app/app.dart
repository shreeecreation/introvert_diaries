
import 'package:introvertdiaries/src/core/core.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveSizer(
      builder: (context) {
        return MaterialApp.router(
          restorationScopeId: 'root',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(
            navigatorObservers: () => [
            ],
          ),
          builder: (BuildContext context, Widget? child) {
            return child!;
          },
        );
      },
    );
  }
}

