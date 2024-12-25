import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:introvertdiaries/src/core/core.dart';

class CustomDropdownFormField<T extends Object> extends StatelessWidget {
  const CustomDropdownFormField({
    required this.items,
    required this.onChanged,
    required this.displayString,
    super.key,
    this.onSaved,
    this.value,
    this.hint,
    this.title,
    this.fullWidth = false,
    this.validator,
    this.leading,
  });

  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final FormFieldSetter<T?>? onSaved;
  final String? hint;
  final String? title;
  final bool fullWidth;
  final String? Function(T?)? validator;
  final Widget? leading;
  final String Function(T item) displayString;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: AppTextStyles.text14PxSemiBold.copyWith(color: AppColors.secondaryColor),
        ),
        8.verticalSpace,
        DropdownButtonFormField2<T>(
          isExpanded: true,
          validator: validator,
          selectedItemBuilder: (_) {
            return [
              for (final item in items)
                Row(
                  children: [
                    if (leading != null) ...[leading!, 8.horizontalSpace],
                    Expanded(
                      child: Text(
                        displayString(item),
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.text13PxSemiBold.primary,
                      ),
                    ),
                  ],
                ),
            ];
          },
          value: value,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            focusColor: AppColors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.secondaryColor),
            ),
            contentPadding: const EdgeInsets.only(top: 13, bottom: 13, right: 13),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.statusRed,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.border,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.border),
            ),
          ),
          hint: Row(
            children: [
              if (leading != null) ...[leading!, 8.horizontalSpace],
              Expanded(
                child: Text(
                  hint ?? 'select',
                  style: AppTextStyles.text14PxSemiBold.copyWith(
                    color: AppColors.greyColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          items: [
            for (final item in items)
              DropdownMenuItem<T>(
                value: item,
                child: ColoredBox(
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            displayString(item),
                            style: AppTextStyles.text13PxSemiBold.primary,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      if (item != items.last) const Divider(color: AppColors.border),
                    ],
                  ),
                ),
              ),
          ],
          onChanged: (value) {
            validator?.call(value);
            onChanged(value);
          },
          buttonStyleData: const ButtonStyleData(
            overlayColor: WidgetStatePropertyAll(AppColors.white),
            padding: EdgeInsets.zero,
          ),
          iconStyleData: const IconStyleData(icon: Icon(Icons.keyboard_arrow_down, size: 24)),
          dropdownStyleData: DropdownStyleData(
            direction: DropdownDirection.left,
            width: fullWidth ? context.width : null,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            overlayColor: WidgetStatePropertyAll(AppColors.white),
          ),
        ),
      ],
    );
  }
}
