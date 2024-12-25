import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class NotificationCountWidget extends StatelessWidget {
  const NotificationCountWidget({
    required this.count, required this.title, super.key,
  });

  final String count;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.text14PxSemiBold,
        ),
        5.horizontalSpace,
        if (count == '0') const SizedBox.shrink() else Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.statusRed,
                ),
                height: 25,
                width: 25,
                child: Center(
                  child: Text(
                    count,
                    style: AppTextStyles.text12Px.white,
                  ),
                ),
              ),
      ],
    );
  }
}
