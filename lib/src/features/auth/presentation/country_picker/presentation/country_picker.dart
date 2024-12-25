import 'package:flutter/material.dart' hide showSearch;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../cubit/get_country_picker_provider.dart';

class CountryPicker extends HookWidget {
  CountryPicker._(this.selectedCountry);

  final CountryModel? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    useEffect(() {
      context.read<CountryInfoCubit>().clearSearch();
      return null;
    }, []);
    // searchController.addListener(() {
    //   ref
    //       .read(countryPickerNotifierProvider(context).notifier)
    //       .search(searchController.text);
    // });
    // final reference = ref.watch(countryPickerNotifierProvider(context));
    return BlocBuilder<CountryInfoCubit, CountryInfoState>(
      builder: (context, state) => state.maybeWhen(
        error: (error) => Container(
          child: Text(error),
        ),
        orElse: Container.new,
        success: (data, selectedCountry) {
          return Column(
            children: [
              Text('Select  Country', style: AppTextStyles.text16Px.black),
              10.verticalSpace,
              CustomTextField(
                controller: searchController,
                onChanged: (value) =>
                    context.read<CountryInfoCubit>().search(value),
                hintText: 'Search Country',
              ).px(20),
              12.verticalSpace,
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemCount: data.length,
                  initialScrollIndex: selectedCountry != null
                      ? data.indexOf(selectedCountry)
                      : 0,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      leading: item.emoji != null
                          ? Text(
                              item.emoji!,
                              style: AppTextStyles.text24PxBold,
                            )
                          : null,
                      onTap: () {
                        Navigator.of(context).pop(item);
                        context.read<CountryInfoCubit>().selectCountry(item);
                      },
                      title: Text(item.name),
                      subtitle: Text(item.dialCode),
                      selected: selectedCountry?.code == item.code,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Future<CountryModel?> selectFirst(BuildContext context) async {
    // BlocProvider(create: (context) => getIt<CountryInfoCubit>());

    final response =
        await context.read<CountryInfoCubit>().selectUserCountryCode();
    return response;

    // BlocProvider.of<CountryInfoCubit>(context).state.maybeWhen(orElse: () {
    //   // Navigator.of(context).pop();
    // }, success: (data) {
    //   success(data.first);
    // });
  }

  static Future<CountryModel?> show(
    BuildContext context, {
    bool showCountryCode = true,
    CountryModel? selectedCountry,
  }) async {
    final response = await showAppBottomSheet<CountryModel>(
        enableScroll: true,
        context,
        FractionallySizedBox(
            heightFactor: .9,
            child: Builder(builder: (context) {
              return CountryPicker._(selectedCountry);
            })
            // BlocProvider(
            //   create: (context) => getIt<CountryInfoCubit>()..initialize(),
            //   child: CountryPicker._(selectedCountry),
            // ),
            ));

    return response;
  }
}
