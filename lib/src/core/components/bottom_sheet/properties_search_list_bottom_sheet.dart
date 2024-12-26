import 'package:introvertdiaries/src/core/core.dart';

class PropertiesSearchListBottomSheet extends StatelessWidget {
  const PropertiesSearchListBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final properties = <String>[
      'All Properties',
      'Property 1',
      'Property 2',
      'Property 3',
      'Property 4',
      'Property 5',
      'Property 6',
      'Property 7',
      'Property 8',
      'Property 9',
      'Property 10',
    ];
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  borderSide: const BorderSide(color: AppColors.border),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  hintText: 'Search Properties',
                  hintStyle: AppTextStyles.text14Px.textGrey,
                  inputAction: TextInputAction.search,
                  fieldContentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                ),
                10.verticalSpace,
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        properties[index],
                        style: index == 0
                            ? AppTextStyles.text13PxMedium
                            : AppTextStyles.text14PxMedium,
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
    await showAppBottomSheet<dynamic>(
      context,
      enableScroll: true,
      const PropertiesSearchListBottomSheet(),
    );
  }
}
