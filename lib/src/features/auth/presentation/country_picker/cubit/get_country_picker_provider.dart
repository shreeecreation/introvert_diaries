import 'dart:convert';

import 'package:devicelocale/devicelocale.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';

part 'get_country_picker_provider.freezed.dart';

@freezed
class CountryInfoState with _$CountryInfoState {
  const factory CountryInfoState.initial() = _Initial;
  const factory CountryInfoState.loading() = _Loading;
  const factory CountryInfoState.error(String error) = _Error;
  const factory CountryInfoState.success(
      List<CountryModel> data, CountryModel? selectedCountry) = _Success;
}

@LazySingleton()
class CountryInfoCubit extends Cubit<CountryInfoState> {
  CountryInfoCubit(this._appRouter) : super(const CountryInfoState.initial()) {}

  final AppRouter _appRouter;
  String? _countryCode;

  Future<void> initialize() async {
    try {
      emit(const CountryInfoState.loading());
      _countryCode = (await Devicelocale.currentAsLocale)?.countryCode;
      final response =
          await DefaultAssetBundle.of(_appRouter.navigatorKey.currentContext!)
              .loadString('assets/country_info.json');
      final data = jsonDecode(response) as List<dynamic>;
      final _countries = List<CountryModel>.from(data
          .map((data) => CountryModel.fromJson(data as Map<String, dynamic>)));
      countries.addAll(_countries);
      searchedCountry.addAll(_countries);
      emit(CountryInfoState.success(countries, _countries[14]));
    } catch (e) {
      emit(CountryInfoState.error(e.toString()));
    }
  }

  final List<CountryModel> countries = [];
  List<CountryModel> searchedCountry = [];

  // select according user region
  CountryModel selectUserCountryCode() {
    searchedCountry
      ..clear()
      ..addAll(countries);
    final countryCode =
        _countryCode ?? WidgetsBinding.instance.window.locale.countryCode;
    final _country = searchedCountry.firstWhere(
        (element) => element.code.toLowerCase() == countryCode!.toLowerCase(),
        orElse: () => countries.first,);
    return _country;
  }

  void search(String country) {
    if (state is _Success) {
      // final Set<CountryModel> uniqueCountries = Set<CountryModel>.from(searchedCountry);
      final _state = state as _Success;
      searchedCountry
        ..clear()
        ..addAll(countries)
        ..toSet();

      final _countries = searchedCountry
          .where((element) =>
              element.name.toLowerCase().contains(country.toLowerCase()))
          .toSet();
      emit(CountryInfoState.success(
          _countries.toList(), _state.selectedCountry));
    }
  }

  void clearSearch() {
    final _state = state as _Success;

    emit(CountryInfoState.success(countries, _state.selectedCountry));
  }

  void selectCountry(CountryModel country) {
    emit(CountryInfoState.success(countries, country));
  }
}
