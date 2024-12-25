import 'package:introvertdiaries/src/core/core.dart';
part 'base_api_state.freezed.dart';

@freezed
class BaseApiState<T> with _$BaseApiState<T> {
  const factory BaseApiState.success(T data) = _Success;
  const factory BaseApiState.initial() = _Initial;
  const factory BaseApiState.loading() = _Loading;
  const factory BaseApiState.error(String message) = _Error;
  const factory BaseApiState.noInternet() = _NoInternet;
}

BaseApiState<T> changeSuccess<T>(T data) {
  return BaseApiState.success(data);
}

BaseApiState<T> changeError<T>(AppError error) {
  return error.when(
    serverError: BaseApiState.error,
    noInternet: (err) => BaseApiState.error(err.message),
  );
}
