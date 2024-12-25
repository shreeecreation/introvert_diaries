import 'package:flutter/foundation.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/app/app.dart';
import 'package:logging/logging.dart';
import 'bootstrap.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  }
  // await dotenv.load(fileName: '.env-development');
  await bootstrap(() => App());
}
