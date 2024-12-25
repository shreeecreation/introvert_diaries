// import 'package:dartz/dartz.dart';
// import 'package:shm_vendor/core/api/api.dart';
// import 'package:shm_vendor/core/network/network_info.dart';

// import '../../typedefs/typedefs.dart';

// /// {@template base_repository}
// /// A [BaseRepository] class for handling network status and exceptions
// /// {@endtemplate}
// class BaseRepository {
//   BaseRepository(this._networkInfo);

//   final NetworkInfo _networkInfo;

//   ///
//   /// [T] is Return type for [EitherResponse]
//   ///
//   /// [R] is response type from server that is params for [onSuccess] callback
//   ///
//   /// [onSuccess] callback returns the [T] and accept [R]
//   ///
//   EitherResponse<T> handleNetworkCall<R, T>({
//     required Future<R> call,
//     required T Function(R data) onSuccess,
//   }) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         final data = await call;
//         return right(onSuccess(data));
//       } on ApiException catch (e) {
//         return left(e.when(
//           serverException: (message) => AppError.serverError(
//             error: ServerError(message: message),
//           ),
//           unprocessableEntity: (message, errors) => AppError.validationError(validationError: ValidationError(message: message, errors: errors)),
//           unAuthorized: () => const AppError.serverError(
//             error: ServerError(message: 'UnAuthorized', code: 401),
//           ),
//           network: () => const AppError.noInternet(error: NoInternetError()),
//           formatException: () => const AppError.serverError(error: ServerError(message: 'Something went wrong')),
//         ));
//       }
//     } else {
//       return left(const AppError.noInternet(error: NoInternetError()));
//     }
//   }
// }
