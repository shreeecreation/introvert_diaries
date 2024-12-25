import 'package:introvertdiaries/src/core/core.dart';

Future<T?> showAppBottomSheet<T>(
  BuildContext context,
  Widget child, {
  AnimationController? animation,
  TickerProvider? vsync,
  bool enableScroll = false,
  bool enableDrag = true,
  void Function()? onComplete,
  bool isDismissible = true,
}) async {
  return showModalBottomSheet<T?>(
    context: context,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: child,
      );
    },
    backgroundColor: AppColors.white,
    showDragHandle: true,
    isScrollControlled: true,
    useRootNavigator: true,
    anchorPoint: Offset.zero,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  ).whenComplete(() => onComplete?.call());
}
