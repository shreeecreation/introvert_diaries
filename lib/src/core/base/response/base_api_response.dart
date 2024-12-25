import 'package:equatable/equatable.dart';

class ApiResponse<T extends Object> extends Equatable {
  const ApiResponse({
    required this.data,
    required this.detail,
    this.nonFieldErrors,
    this.responseType,
    this.count,
    this.next,
    this.previous,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['results'] as T,
      detail: json['detail'] as String?,
      responseType: json['responseType'] as String?,
      nonFieldErrors: json['non_field_errors'] as List<String>?,
    );
  }

  final String? detail;
  final T data;
  final String? responseType;
  final List<String>? nonFieldErrors;
  final int? count;
  final String? next;
  final String? previous;

  @override
  List<Object?> get props => [detail, data, responseType];
}
