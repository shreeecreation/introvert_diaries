import 'package:introvertdiaries/src/core/core.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.inputAction = TextInputAction.done,
    this.inputType = TextInputType.text,
    this.borderSide = const BorderSide(),
    this.controller,
    this.labelText,
    this.readOnly = false,
    this.onTap,
    this.isPasswordField = false,
    this.suffix,
    this.prefix,
    this.prefixIcon,
    this.borderRadius,
    this.textCapitalization,
    this.fieldContentPadding,
    this.initialValues,
    this.validator,
    this.maxLines = 1,
    this.inputFormatters = const [],
    this.hintStyle,
    this.fillColor = AppColors.white,
    this.autoFocus,
    this.textFieldLabel,
    this.isBorderNone = true,
    this.labelStyle,
    this.minLines,
    this.focusNode,
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final BorderSide? borderSide;
  final TextEditingController? controller;
  final String? labelText;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isPasswordField;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final TextCapitalization? textCapitalization;
  final EdgeInsets? fieldContentPadding;
  final String? initialValues;
  final String? Function(String? value)? validator;
  final TextStyle? hintStyle;
  final bool? autoFocus;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter> inputFormatters;
  final String? textFieldLabel;
  final bool isBorderNone;
  final TextStyle? labelStyle;
  final Color fillColor;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (textFieldLabel != null)
          Text(
            textFieldLabel ?? '',
            style: AppTextStyles.text14PxSemiBold.copyWith(color: AppColors.secondaryColor),
          ).pOnly(left: !isBorderNone ? 10 : 0),
        if (textFieldLabel != null && isBorderNone) 10.verticalSpace,
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: radius),
          child: TextFormField(
            
            validator: validator,
            focusNode: focusNode,
            autofocus: autoFocus ?? false,
            inputFormatters: inputFormatters,
            obscureText: isPasswordField,
            style: labelStyle ?? AppTextStyles.text16PxMedium.primary,
            obscuringCharacter: '⦁',
            controller: controller,
            keyboardType: inputType,
            onTap: onTap,
            textInputAction: inputAction,
            onChanged: (text) {
              onChanged?.call(text.trim());
            },
            maxLines: maxLines,
            minLines: minLines,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly,
            decoration: InputDecoration(
              
              filled: true,
              fillColor: fillColor,
              contentPadding: fieldContentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 21,
                  ),
              border: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide.none,
              ),
              focusColor: AppColors.primaryColor,
              errorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: const BorderSide(
                  color: AppColors.statusRed,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: const BorderSide(
                  color: AppColors.border,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: const BorderSide(
                  color: AppColors.statusRed,
                ),
              ),
              errorText: errorText != null && errorText!.isNotEmpty ? errorText : null,
              hintText: hintText,
              suffixIcon: suffixIcon,
              suffix: suffix,
              prefix: prefix,
              prefixIcon: prefixIcon != null
                  ? fieldContentPadding != null
                      ? SizedBox(
                          // height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                5.horizontalSpace,
                                prefixIcon ?? const SizedBox(),
                                3.horizontalSpace,
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                prefixIcon ?? const SizedBox(),
                                3.horizontalSpace,
                              ],
                            ),
                          ),
                        )
                  : null,
              labelText: labelText,
              labelStyle: labelStyle ??
                  AppTextStyles.text16PxMedium.copyWith(
                    color: AppColors.primaryColor,
                  ),
              hintStyle: hintStyle ??
                  AppTextStyles.text14PxSemiBold.copyWith(
                    decoration: TextDecoration.none,
                    color: AppColors.greyColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
