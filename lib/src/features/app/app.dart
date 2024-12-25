
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/presentation/country_picker/cubit/get_country_picker_provider.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CountryInfoCubit>()..initialize(),
      child: AdaptiveSizer(
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
      ),
    );
  }
}

