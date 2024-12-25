// ignore_for_file: avoid_dynamic_calls

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:flutter/foundation.dart';

extension DioExceptionX on DioException {
  AppError get toException {
    if (kDebugMode) {
      print(error);
    }
    final data = response?.data as Map<String, dynamic>? ?? {};
    switch (type) {
      case DioExceptionType.badResponse:
        if ((response?.statusCode ?? 0) >= 500) {
          return AppError.serverError(
            error: response?.statusMessage ?? 'Server Error',
          );
        }

        String? errorMessage;
        if (data['details'] is String?) {
          errorMessage = data['details'] as String?;
        } else if (data['details'] is Map<String, dynamic>) {
          errorMessage = (data['details']?['profile']?['phone_number'] as List?)?.first as String?;

          errorMessage ??=
              ((data['details'] as Map<String, dynamic>).values.first as List?)?.first as String?;
        } else {
          errorMessage =
              'Unable to process error. This happens if error is not in standard format.';
        }

        return AppError.serverError(error: errorMessage ?? 'Some error occurred');

      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (error is SocketException) {
          return const AppError.noInternet(error: NoInternetError());
        } else {
          return AppError.serverError(
            error: response?.statusMessage ?? 'Some error occurred',
          );
        }
    }
  }
}
