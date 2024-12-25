import 'package:equatable/equatable.dart';
import 'package:introvertdiaries/src/core/core.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.success,
    required this.data,
    required this.message,
    this.responseType,
    this.pagination,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] as bool,
      data: json['data'] as T,
      message: json['message'] as String?,
      responseType: json['responseType'] as String?,
    );
  }

  final bool success;
  final String? message;
  final T data;
  final String? responseType;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [success, message, data, responseType];

  // tojson
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'responseType': responseType,
    };
  }
}
