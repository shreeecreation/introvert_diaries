import 'package:dartz/dartz.dart';
import 'package:introvertdiaries/src/core/api/api.dart';


typedef EitherResponse<T> = Future<Either<AppError, T>>;
