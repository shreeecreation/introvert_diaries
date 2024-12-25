import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

part 'phone_number_state.dart';
part 'phone_number_cubit.freezed.dart';

@injectable
class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit()
      : super(
          const PhoneNumberState(
            numberField: const Field<String>(value: ''),
            countryCodeField: const Field<CountryModel?>(value: null),
            appSignature: const Field<String>(value: ''),
          ),
        );

  String appSignature = '';
  void onNumberChange(String value) {
    late Field<String> _numberField;
    if (value.isNotEmpty && value.isNumber)
      _numberField = state.numberField
          .copyWith(value: value, errorMessage: '', isValid: true);
    else
      _numberField = state.numberField.copyWith(
          value: value, errorMessage: 'Invalid Phone Number', isValid: false);
    emit(state.copyWith(numberField: _numberField));
  }

  void selectCountryCode(CountryModel value) {
    late Field<CountryModel?> _countryCodeField;
    late Field<String> _appSignature;

    if (value.dialCode.isNotEmpty) {
      _countryCodeField = state.countryCodeField
          .copyWith(value: value, errorMessage: '', isValid: true);
    } else {
      _countryCodeField = state.countryCodeField.copyWith(
        value: value,
        errorMessage: 'Invalid Country Code',
        isValid: false,
      );
    }
    SmsAutoFill().getAppSignature.then((values) {
      _appSignature = state.appSignature
          .copyWith(value: values, errorMessage: '', isValid: true);
      appSignature = _appSignature.value;
      emit(state.copyWith(appSignature: _appSignature));
      SmsAutoFill().listenForCode();
    });
    emit(state.copyWith(countryCodeField: _countryCodeField));
  }
}
