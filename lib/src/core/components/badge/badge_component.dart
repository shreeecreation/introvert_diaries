import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class BadgeComponent extends StatelessWidget {
  const BadgeComponent({
    required this.title,
    super.key,
    this.color = AppColors.textGrey,
    this.textColor = AppColors.black,
    this.borderColor = AppColors.transparent,
  });

  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            title,
            style: AppTextStyles.text11PxSemiBold.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
