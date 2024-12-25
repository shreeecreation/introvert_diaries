import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:introvertdiaries/src/core/core.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._service);

  final SessionService _service;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {

    if (err.response?.statusCode == 401) {
     
      // await BlocProvider.of<RefreshTokenCubit>(context!).state.maybeWhen(
      //   orElse: () {
      //     handler.reject(err);
      //     _service.removeToken();
      //   },
      //   success: (data) async {
      //     final options = err.requestOptions;
      //     options.headers.addAll({'Authorization': 'Bearer $data'});
      //     try {
      //       final dio = Dio(
      //         BaseOptions(
      //           baseUrl: ApiEndpoints.baseUrl,
      //           headers: {
      //             'Authorization': 'Bearer $data',
      //           },
      //         ),
      //       );
      //       if (options.data is FormData) {
      //         final newFormData = FormData();
      //         final oldFormData = options.data as FormData;

      //         newFormData.fields.addAll(oldFormData.fields);

      //         for (final mapFile in oldFormData.files) {
      //           final originalFilePath = mapFile.value.filename!;
      //           newFormData.files.add(
      //             MapEntry(
      //               mapFile.key,
      //               await MultipartFile.fromFile(
      //                 originalFilePath,
      //                 filename: mapFile.value.filename,
      //               ),
      //             ),
      //           );
      //         }
      //         options.data = newFormData;
      //       } else {}

      //       err.requestOptions.headers['Authorization'] = 'Bearer $data';

      //       return handler.resolve(await dio.fetch(options));
      //     } catch (e) {
      //       handler.next(err);
      //     }
      //   },
      //   error: (message) {
      //     log(message);
      //   },
      // );
   
    } else {
      handler.reject(err);
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasSession = _service.hasSession;
    try {
      if (hasSession) {
        final token = _service.accessToken;
        options.headers.addAll({'Authorization': 'Bearer $token'});
        // if (_tokenExpired(token)) {
        //   if (_refreshCompleter == null) {
        //     _refreshCompleter = Completer<void>();
        //     final context = getIt<AppRouter>().navigatorKey.currentContext;
        //     if (!context!.mounted) return;

        //     await context.read<RefreshTokenCubit>().refreshToken((token) {
        //       _refreshCompleter!.complete();
        //       _refreshCompleter = null;
        //     });
        //   }
        //   await _refreshCompleter!.future;
        // }
      }
    } catch (e) {
      log(e.toString());
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  // bool _tokenExpired(String? token) {
  //   if (token == null) return true;

  //   try {
  //     final parts = token.split('.');
  //     if (parts.length != 3) return true;

  //     final payload = parts[1];
  //     final normalizedPayload = base64Url.normalize(payload);
  //     final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
  //     final payloadMap = jsonDecode(decodedPayload) as Map<String, dynamic>;

  //     if (!payloadMap.containsKey('exp')) return true;

  //     final exp = payloadMap['exp'] as int;

  //     final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  //     return exp < currentTime;
  //   } catch (e) {
  //     return true;
  //   }
  // }


}
