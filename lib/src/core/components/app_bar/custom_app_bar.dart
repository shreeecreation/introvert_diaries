import 'package:introvertdiaries/src/core/core.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: AppColors.scaffoldBackground,
      toolbarHeight: 80,
      leadingWidth: 100,
      leading: BackWidget(),
    );
  }
}
