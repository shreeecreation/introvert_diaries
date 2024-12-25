import 'package:introvertdiaries/src/core/core.dart';

class EmergencyFloatingActionButton extends StatelessWidget {
  const EmergencyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(92)),
      child: Material(
        color: AppColors.statusRed,
        child: GestureDetector(
          // onTap: () => context.pushRoute(const EmergencyContactsRoute()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                Assets.svg.homePage.emergency.svg(),
                Text(
                  'Emergency',
                  style: AppTextStyles.text16PxBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
