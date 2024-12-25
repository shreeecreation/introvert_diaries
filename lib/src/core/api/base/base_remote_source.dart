// [BaseRemoteSource] for handling network requests for dio client
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:introvertdiaries/src/core/core.dart';

class BaseRemoteSource {
  BaseRemoteSource(this._dio, this._networkInfo);

  final Dio _dio;
  final context = getIt<AppRouter>().navigatorKey.currentContext;
  final NetworkInfo _networkInfo;

  /// [T] is return type from network request
  ///
  /// [request] callback returns [Response] and accepts [Dio] instance
  ///
  /// onResponse callback returns [T] and accepts [dynamic] data from [Response]
  ///
  /// throws [ApiException]
  EitherResponse<T> networkRequest<T>({
    required Future<T> Function(Dio dio) request,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await request(_dio);
        return right(response);
      } on ApiException catch (e) {
        return left(
          e.when(
            serverException: (message) => AppError.serverError(error: message),
            unprocessableEntity: (message, errors) => AppError.serverError(error: message),
            unAuthorized: () => const AppError.serverError(error: 'UnAuthorized'),
            network: () => const AppError.noInternet(error: NoInternetError()),
            formatException: () => const AppError.serverError(error: 'Something went wrong'),
          ),
        );
      } on DioException catch (e) {
        return left(e.toException);
      }
    } else {
      // final context = getIt<AppRouter>().navigatorKey.currentContext;
      // ignore: use_build_context_synchronously
      // context!.pushRoute(const NoInternetRoute());
      return left(const AppError.noInternet(error: NoInternetError()));
    }
  }
}
