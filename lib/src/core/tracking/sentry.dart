import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class introvertdiariesSentry {
  static Future<void> init(VoidCallback runApp, {String? env}) async {
    if (env == 'development') return runApp();

    log('SENTRY INITIALIZED');
    await SentryFlutter.init(
      (options) {
        options
          ..dsn =
              'https://136e9bdd09c1d02d6733fdbc18248362@o4508142243217408.ingest.us.sentry.io/4508142249705472'
          ..environment = env ?? 'production';
      },
      appRunner: runApp,
    );
  }

  static void captureException({required dynamic exception, StackTrace? stackTrace, Hint? hint}) {
    Sentry.captureException(exception, stackTrace: stackTrace, hint: hint);
  }
}
