// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneNumberState {
  Field<String> get numberField => throw _privateConstructorUsedError;
  Field<CountryModel?> get countryCodeField =>
      throw _privateConstructorUsedError;
  Field<String> get appSignature => throw _privateConstructorUsedError;

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneNumberStateCopyWith<PhoneNumberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberStateCopyWith<$Res> {
  factory $PhoneNumberStateCopyWith(
          PhoneNumberState value, $Res Function(PhoneNumberState) then) =
      _$PhoneNumberStateCopyWithImpl<$Res, PhoneNumberState>;
  @useResult
  $Res call(
      {Field<String> numberField,
      Field<CountryModel?> countryCodeField,
      Field<String> appSignature});

  $FieldCopyWith<String, $Res> get numberField;
  $FieldCopyWith<CountryModel?, $Res> get countryCodeField;
  $FieldCopyWith<String, $Res> get appSignature;
}

/// @nodoc
class _$PhoneNumberStateCopyWithImpl<$Res, $Val extends PhoneNumberState>
    implements $PhoneNumberStateCopyWith<$Res> {
  _$PhoneNumberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberField = null,
    Object? countryCodeField = null,
    Object? appSignature = null,
  }) {
    return _then(_value.copyWith(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      countryCodeField: null == countryCodeField
          ? _value.countryCodeField
          : countryCodeField // ignore: cast_nullable_to_non_nullable
              as Field<CountryModel?>,
      appSignature: null == appSignature
          ? _value.appSignature
          : appSignature // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ) as $Val);
  }

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get numberField {
    return $FieldCopyWith<String, $Res>(_value.numberField, (value) {
      return _then(_value.copyWith(numberField: value) as $Val);
    });
  }

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<CountryModel?, $Res> get countryCodeField {
    return $FieldCopyWith<CountryModel?, $Res>(_value.countryCodeField,
        (value) {
      return _then(_value.copyWith(countryCodeField: value) as $Val);
    });
  }

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get appSignature {
    return $FieldCopyWith<String, $Res>(_value.appSignature, (value) {
      return _then(_value.copyWith(appSignature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhoneNumberStateImplCopyWith<$Res>
    implements $PhoneNumberStateCopyWith<$Res> {
  factory _$$PhoneNumberStateImplCopyWith(_$PhoneNumberStateImpl value,
          $Res Function(_$PhoneNumberStateImpl) then) =
      __$$PhoneNumberStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Field<String> numberField,
      Field<CountryModel?> countryCodeField,
      Field<String> appSignature});

  @override
  $FieldCopyWith<String, $Res> get numberField;
  @override
  $FieldCopyWith<CountryModel?, $Res> get countryCodeField;
  @override
  $FieldCopyWith<String, $Res> get appSignature;
}

/// @nodoc
class __$$PhoneNumberStateImplCopyWithImpl<$Res>
    extends _$PhoneNumberStateCopyWithImpl<$Res, _$PhoneNumberStateImpl>
    implements _$$PhoneNumberStateImplCopyWith<$Res> {
  __$$PhoneNumberStateImplCopyWithImpl(_$PhoneNumberStateImpl _value,
      $Res Function(_$PhoneNumberStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberField = null,
    Object? countryCodeField = null,
    Object? appSignature = null,
  }) {
    return _then(_$PhoneNumberStateImpl(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      countryCodeField: null == countryCodeField
          ? _value.countryCodeField
          : countryCodeField // ignore: cast_nullable_to_non_nullable
              as Field<CountryModel?>,
      appSignature: null == appSignature
          ? _value.appSignature
          : appSignature // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ));
  }
}

/// @nodoc

class _$PhoneNumberStateImpl extends _PhoneNumberState {
  const _$PhoneNumberStateImpl(
      {required this.numberField,
      required this.countryCodeField,
      required this.appSignature})
      : super._();

  @override
  final Field<String> numberField;
  @override
  final Field<CountryModel?> countryCodeField;
  @override
  final Field<String> appSignature;

  @override
  String toString() {
    return 'PhoneNumberState(numberField: $numberField, countryCodeField: $countryCodeField, appSignature: $appSignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberStateImpl &&
            (identical(other.numberField, numberField) ||
                other.numberField == numberField) &&
            (identical(other.countryCodeField, countryCodeField) ||
                other.countryCodeField == countryCodeField) &&
            (identical(other.appSignature, appSignature) ||
                other.appSignature == appSignature));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, numberField, countryCodeField, appSignature);

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberStateImplCopyWith<_$PhoneNumberStateImpl> get copyWith =>
      __$$PhoneNumberStateImplCopyWithImpl<_$PhoneNumberStateImpl>(
          this, _$identity);
}

abstract class _PhoneNumberState extends PhoneNumberState {
  const factory _PhoneNumberState(
      {required final Field<String> numberField,
      required final Field<CountryModel?> countryCodeField,
      required final Field<String> appSignature}) = _$PhoneNumberStateImpl;
  const _PhoneNumberState._() : super._();

  @override
  Field<String> get numberField;
  @override
  Field<CountryModel?> get countryCodeField;
  @override
  Field<String> get appSignature;

  /// Create a copy of PhoneNumberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberStateImplCopyWith<_$PhoneNumberStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
