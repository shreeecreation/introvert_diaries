import 'package:introvertdiaries/src/core/core.dart';

class CustomCircularProgressIndicator extends CircularProgressIndicator {
  const CustomCircularProgressIndicator({super.key});

  @override
  Color? get color => AppColors.textGrey;

  @override
  double get strokeWidth => 3;
}
