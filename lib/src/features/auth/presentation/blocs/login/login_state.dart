part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.error({required String message}) = _Error;

  const factory LoginState.validationError(
      {required String message,
      @Default({}) Map<String, dynamic> errors}) = _ValidationError;

  const factory LoginState.success({required String message}) = _Success;
}
