import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    required this.message,
    super.key,
    this.error = false,
  });

  final String message;
  final bool error;

  Color get bgFrontColor => error ? Colors.red : AppColors.primaryTextDark;

  Color get textColor => AppColors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Text(
          message,
          style: AppTextStyles.text14PxMedium.copyWith(color: textColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
