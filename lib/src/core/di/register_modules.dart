import 'package:dio/dio.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/core/interceptor/interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModules {
  @singleton
  AppRouter get router => AppRouter();

  @lazySingleton
  InternetConnectionChecker get connectionChecker => InternetConnectionChecker();

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) => Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          receiveTimeout: const Duration(milliseconds: 60000),
          connectTimeout: const Duration(milliseconds: 60000),
          headers: <String, dynamic>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      )..interceptors.addAll([
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
            ),
          authInterceptor,
        ]);
}
