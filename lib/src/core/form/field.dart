import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

@freezed
class Field<T> with _$Field<T> {
  const factory Field({
    required T value,
    @Default('') String errorMessage,
    @Default(false) bool isValid,
  }) = _Field<T>;
  const Field._();

  bool get hasError => errorMessage.isNotEmpty;
}
