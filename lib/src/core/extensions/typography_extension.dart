import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

extension TypographyExtension on TextStyle {
  TextStyle get primary => copyWith(color: AppColors.primaryTextDark);
  TextStyle get mindfulBrown => copyWith(color: AppColors.mindfulBrown);
  TextStyle get textGrey => copyWith(color: AppColors.textGrey);
  TextStyle get harp => copyWith(color: AppColors.harp);
  TextStyle get textTileGrey => copyWith(color: const Color(0xFF8B8B8B));
  TextStyle get statusGreen => copyWith(color: AppColors.statusGreen);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get red => copyWith(color: AppColors.statusRed);
  TextStyle get textBlueFile => copyWith(color: AppColors.textBlueFile);
  TextStyle get textYellow => copyWith(color: AppColors.textYellow);
  TextStyle get textDarkGrey => copyWith(color: AppColors.textDarkGrey);
  TextStyle get textLightGrey => copyWith(color: const Color(0xFFA2A9B0));
}
