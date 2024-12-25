import 'package:introvertdiaries/src/core/core.dart';

class ValueListenableBadgeComponent<T> extends StatefulWidget {
  const ValueListenableBadgeComponent({
    required this.length,
    required this.status,
    required this.badgeColor,
    required this.badgeDisabledColor,
    required this.onSelected,
    super.key,
    this.borderColor = AppColors.transparent,
  });

  final int length;
  final List<T> status;
  final Color badgeColor;
  final Color badgeDisabledColor;
  final Color borderColor;
  final void Function(int) onSelected;

  @override
  State<ValueListenableBadgeComponent<int>> createState() {
    return _ValueListenableBadgeComponentState();
  }
}

class _ValueListenableBadgeComponentState
    extends State<ValueListenableBadgeComponent<int>> {
  late final ValueNotifier<int> selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = ValueNotifier(0);
  }

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex.value = index;
                    widget.onSelected(selectedIndex.value + 1);
                  },
                  child: BadgeComponent(
                    color: selectedIndex.value == index
                        ? widget.badgeColor
                        : widget.badgeDisabledColor,
                    textColor: selectedIndex.value == index
                        ? AppColors.white
                        : AppColors.tileGrey,
                    title: widget.status[index] as String,
                    borderColor: AppColors.border,
                  ).px(4),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
