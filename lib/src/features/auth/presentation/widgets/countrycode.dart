import 'package:flutter/material.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key, required this.controller, this.onChanged, this.selectedCountry});
  final TextEditingController controller;
  final ValueChanged<CountryModel>? onChanged;
  final CountryModel? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      // height: 56,
      child: CustomTextField(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),

        controller: controller,
        fieldContentPadding: const EdgeInsets.all(17.5),
        onTap: () async {
          final response = await CountryPicker.show(context, selectedCountry: selectedCountry);
          if (response != null) {
            onChanged?.call(response);
          }
        },
        readOnly: true,
        // labelText: 'Country/Region',
      ),
    );
  }
}
