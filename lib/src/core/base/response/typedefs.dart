import 'package:dartz/dartz.dart';
import 'package:introvertdiaries/src/core/core.dart';

typedef EitherResponse<T> = Future<Either<AppError, T>>;

typedef PaginatedEitherResponse<ResponseModel extends Object>
    = Future<Either<AppError, ApiResponse<PaginationModel<ResponseModel>>>>;
