import 'package:introvertdiaries/src/core/core.dart';

class TimeBottomSheet extends StatelessWidget {
  const TimeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final time = <String>[
      'All Time',
      'Last Month',
      'Last 3 Months',
      'Last 6 Months',
      'Last 1 Year',
      'Custom',
    ];

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        time[index],
                        style: AppTextStyles.text14PxSemiBold,
                      ),
                      15.verticalSpace,
                      const Divider(
                        color: AppColors.textGrey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showSearchListBottomSheet(BuildContext context) async {
    await showAppBottomSheet<void>(
      context,
      enableScroll: true,
      const TimeBottomSheet(),
    );
  }
}
