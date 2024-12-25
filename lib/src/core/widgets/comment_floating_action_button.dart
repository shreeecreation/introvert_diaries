import 'package:introvertdiaries/src/core/core.dart';

class CommentFloatingActionButton extends StatelessWidget {
  const CommentFloatingActionButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(92)),
      child: Material(
        color: AppColors.scaffoldBackground,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                Assets.svg.comment.svg(),
                Text(
                  'Comments',
                  style: AppTextStyles.text16PxBold.copyWith(
                    color: AppColors.secondaryColor,
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
