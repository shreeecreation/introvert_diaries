import 'package:introvertdiaries/src/core/core.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, this.color = AppColors.secondaryColor});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.horizontalSpace,
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Assets.svg.arrowLeft.svg(
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
        3.horizontalSpace,
        Text(
          'Back',
          style: AppTextStyles.text17PxSemiBold.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
