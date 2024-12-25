// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Field<T> {
  T get value => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldCopyWith<T, Field<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<T, $Res> {
  factory $FieldCopyWith(Field<T> value, $Res Function(Field<T>) then) =
      _$FieldCopyWithImpl<T, $Res, Field<T>>;
  @useResult
  $Res call({T value, String errorMessage, bool isValid});
}

/// @nodoc
class _$FieldCopyWithImpl<T, $Res, $Val extends Field<T>>
    implements $FieldCopyWith<T, $Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? errorMessage = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldImplCopyWith<T, $Res>
    implements $FieldCopyWith<T, $Res> {
  factory _$$FieldImplCopyWith(
          _$FieldImpl<T> value, $Res Function(_$FieldImpl<T>) then) =
      __$$FieldImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value, String errorMessage, bool isValid});
}

/// @nodoc
class __$$FieldImplCopyWithImpl<T, $Res>
    extends _$FieldCopyWithImpl<T, $Res, _$FieldImpl<T>>
    implements _$$FieldImplCopyWith<T, $Res> {
  __$$FieldImplCopyWithImpl(
      _$FieldImpl<T> _value, $Res Function(_$FieldImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? errorMessage = null,
    Object? isValid = null,
  }) {
    return _then(_$FieldImpl<T>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FieldImpl<T> extends _Field<T> {
  const _$FieldImpl(
      {required this.value, this.errorMessage = '', this.isValid = false})
      : super._();

  @override
  final T value;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'Field<$T>(value: $value, errorMessage: $errorMessage, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(value), errorMessage, isValid);

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldImplCopyWith<T, _$FieldImpl<T>> get copyWith =>
      __$$FieldImplCopyWithImpl<T, _$FieldImpl<T>>(this, _$identity);
}

abstract class _Field<T> extends Field<T> {
  const factory _Field(
      {required final T value,
      final String errorMessage,
      final bool isValid}) = _$FieldImpl<T>;
  const _Field._() : super._();

  @override
  T get value;
  @override
  String get errorMessage;
  @override
  bool get isValid;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldImplCopyWith<T, _$FieldImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
