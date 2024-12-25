import 'package:animations/animations.dart';
import 'package:introvertdiaries/src/core/components/components.dart';
import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({
    required this.title,
    required this.imagePath,
    required this.buttonColor,
    required this.secondButtonTitle,
    required this.onSecondButtonPressed,
    super.key,
  });
  final String title;
  final String imagePath;
  final Color buttonColor;
  final String secondButtonTitle;
  final void Function() onSecondButtonPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: 16.rounded),
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      title: Column(
        children: [
          5.verticalSpace,
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.statusLightRed,
            ),
            height: 48,
            width: 48,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: const ColorFilter.mode(
                AppColors.statusRed,
                BlendMode.srcIn,
              ),
            ).px(10),
          ),
          20.verticalSpace,
          Text(
            title,
            style: AppTextStyles.text14PxSemiBold,
            textAlign: TextAlign.center,
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  label: 'Cancel',
                  textColor: AppColors.black,
                  borderColor: AppColors.greyColor,
                  isDisabled: false,
                  splashColor: AppColors.greyColor,
                  labelStyle: AppTextStyles.text14PxMedium,
                  height: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: CustomButton(
                  height: 40,
                  labelStyle: AppTextStyles.text14PxMedium,
                  label: secondButtonTitle,
                  isDisabled: false,
                  backgroundColor: buttonColor,
                  onPressed: onSecondButtonPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required String imagePath,
    required Color buttonColor,
    required String secondButtonTitle,
    required void Function() onSecondButtonPressed,
  }) {
    showModal<void>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 400),
      ),
      builder: (context) => CustomDialogBox(
        onSecondButtonPressed: onSecondButtonPressed,
        imagePath: imagePath,
        title: title,
        secondButtonTitle: secondButtonTitle,
        buttonColor: buttonColor,
      ),
    );
  }
}
