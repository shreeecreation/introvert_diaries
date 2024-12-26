import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'src/core/core.dart';


bool isFirebaseOpened = false;

class AppBlocObserver extends BlocObserver {
  @override
  Future<void> onChange(BlocBase<dynamic> bloc, Change<dynamic> change) async {
    super.onChange(bloc, change);
    logger.fine('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.fine('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
    await _initDependencies();
    GoogleFonts.config.allowRuntimeFetching = true;

    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        print(details);
      }
      logger.fine(details.exceptionAsString(), details.exception, details.stack);
    };
    Bloc.observer = AppBlocObserver();
  runApp(await builder());
  }
  catch (e, stackTrace) {
    logger.fine('Error during bootstrap: $e', e, stackTrace);
    rethrow;
  }
}

Future<void> _initDependencies() async {
    await Hive.initFlutter();
  Hive.registerAdapter(SessionAdapter());
  await Hive.openBox<SessionEntity>(
    StorageKeys.sessionBox,
  );
  await Hive.openBox<Map<String, dynamic>>(StorageKeys.cacheBox);

  await configureInjection();

}
