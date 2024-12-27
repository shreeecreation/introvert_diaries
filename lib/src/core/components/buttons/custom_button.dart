import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.backgroundColor = AppColors.primaryColor,
    this.disabledColor = AppColors.greyColor,
    this.splashColor = AppColors.transparent,
    this.labelStyle,
    this.textColor = AppColors.white,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    this.borderRadius = 24,
  }) : children = [
          if (loading)
            _ButtonLoading(loadingColor: textColor)
          else
            Text(
              label,
              style: labelStyle?.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ) ??
                  AppTextStyles.text16PxSemiBold.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ),
            ),
        ];

  CustomButton.icon({
    required this.label,
    required this.onPressed,
    required Widget icon,
    super.key,
    this.backgroundColor = AppColors.lightPrimary,
    this.disabledColor = AppColors.textGrey,
    this.splashColor = AppColors.transparent,
    this.labelStyle,
    this.textColor = AppColors.white,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    bool rightIcon = false,
    this.borderRadius = 24,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ) ??
                  AppTextStyles.text16PxBold.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ],
        ];

  CustomButton.iconText({
    required this.label,
    required this.onPressed,
    required Widget icon,
    super.key,
    this.backgroundColor = AppColors.transparent,
    this.disabledColor = AppColors.transparent,
    this.splashColor = AppColors.transparent,
  this.labelStyle,
    this.textColor = AppColors.primaryColor,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    bool rightIcon = false,
    this.borderRadius = 10,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              5.horizontalSpace,
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ) ??
                  AppTextStyles.text16PxBold.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ],
        ];

  CustomButton.text({
    required this.label,
    required this.onPressed,
    super.key,
    this.backgroundColor = AppColors.transparent,
    this.disabledColor = AppColors.transparent,
    this.splashColor = AppColors.transparent,
    this.labelStyle,
    this.textColor = AppColors.primaryColor,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    this.borderRadius = 10,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else
            Text(
              label,
              style: labelStyle?.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ) ??
                  AppTextStyles.text16PxBold.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ),
            ),
        ];

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color disabledColor;
  final Color splashColor;
  final Color textColor;
  final TextStyle? labelStyle;
  final bool loading;
  final bool isDisabled;
  final bool fullWidth;
  final double height;
  final List<Widget> children;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDisabled ? disabledColor : backgroundColor,
      borderRadius: borderRadius.rounded,
      clipBehavior: Clip.antiAlias,
      type: MaterialType.button,
      child: InkWell(
        onTap: (isDisabled || loading) ? null : onPressed,
        splashColor: splashColor,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          height: height.h,
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _ButtonLoading extends StatelessWidget {
  const _ButtonLoading({
    this.loadingColor = AppColors.primaryColor,
  });

  final Color loadingColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.r,
      height: 22.r,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: loadingColor,

        strokeWidth: 1.8,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.borderColor = AppColors.primaryColor,
    this.disabledColor = AppColors.textGrey,
    this.splashColor = AppColors.white,
    this.labelStyle,
    this.textColor = AppColors.primaryColor,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 10.0,
  }) : children = [
          Text(
            label,
            style: labelStyle?.copyWith(
                  color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                ) ??
                AppTextStyles.text16PxMedium.copyWith(
                  color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                ),
          ),
        ];

  CustomOutlinedButton.icon({
    required this.label,
    required this.onPressed,
    required Widget icon,
    super.key,
    bool rightIcon = false,
    this.borderColor = AppColors.primaryColor,
    this.disabledColor = AppColors.textGrey,
    this.splashColor = AppColors.transparent,
    this.labelStyle,
    this.textColor = AppColors.primaryColor,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 10.0,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ) ??
                  AppTextStyles.text16PxBold.copyWith(
                    color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                  ),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ],
        ];

  final String label;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color disabledColor;
  final Color splashColor;
  final Color textColor;
  final TextStyle? labelStyle;
  final bool loading;
  final bool isDisabled;
  final bool fullWidth;
  final double height;
  final List<Widget> children;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: 24.rounded,
        side: BorderSide(
          color: isDisabled ? disabledColor : borderColor,
          width: 0.5.r,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      type: MaterialType.button,
      child: InkWell(
        onTap: (isDisabled || loading) ? null : onPressed,
        splashColor: splashColor,
        child: AnimatedContainer(
          color: splashColor,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          height: height.h,
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
