part of 'phone_number_cubit.dart';

@freezed
class PhoneNumberState with _$PhoneNumberState, FormMixin {
  const PhoneNumberState._();
  const factory PhoneNumberState({
    required Field<String> numberField,
    required Field<CountryModel?> countryCodeField,
    required Field<String> appSignature,
  }) = _PhoneNumberState;

  @override
  List<Field<dynamic>> get fields =>
      [numberField, countryCodeField, appSignature];

  @override
  Map<String, dynamic> get values => {
        'phoneNumber': numberField.value.trim(),
        'countryCode': countryCodeField.value?.dialCode ?? '',
        'type': 'PHONE',
        'appSignature': appSignature.value.trim(),
      };
}
