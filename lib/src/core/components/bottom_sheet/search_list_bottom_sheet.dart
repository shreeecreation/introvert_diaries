import 'package:introvertdiaries/src/core/core.dart';

class SearchListBottomSheet extends StatelessWidget {
  const SearchListBottomSheet({
    required this.onTapCallBack,
    super.key,
  });
  final void Function(String value) onTapCallBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchFieldWithList(
              onTapCallBack: onTapCallBack,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showSearchListBottomSheet(
  BuildContext context,
  void Function(String value) onTapCallBack,
) async {
  await showAppBottomSheet<dynamic>(
    context,
    enableScroll: true,
    SearchListBottomSheet(onTapCallBack: onTapCallBack),
  );
}

class SearchFieldWithList extends StatefulWidget {
  const SearchFieldWithList({
    required this.onTapCallBack,
    super.key,
  });
  final void Function(String value) onTapCallBack;

  @override
  // ignore: library_private_types_in_public_api
  _SearchFieldWithListState createState() => _SearchFieldWithListState();
}

class _SearchFieldWithListState extends State<SearchFieldWithList> {
  final List<String> _topics = [
    'Why is my rent not showing in rent history?',
    'How are you ByteCare Technology',
    'Primary Text 1',
    'Primary Text 2',
    'Primary Text 3',
  ];

  final ValueNotifier<List<String>> _filteredTopics =
      ValueNotifier<List<String>>([]);
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTopics.value = _topics;
    _searchController.addListener(_filterTopics);
  }

  void _filterTopics() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      _filteredTopics.value = _topics;
    } else {
      _filteredTopics.value = _topics
          .where((topic) => topic.toLowerCase().contains(query))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _filteredTopics.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          borderSide: const BorderSide(color: AppColors.border),
          onTap: () {},
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          hintText: 'Select a topic',
          hintStyle: AppTextStyles.text14Px.copyWith(color: AppColors.border),
          controller: _searchController,
        ),
        ValueListenableBuilder<List<String>>(
          valueListenable: _filteredTopics,
          builder: (context, topics, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: topics.map((topic) {
                return GestureDetector(
                  onTap: () {
                    widget.onTapCallBack(topic);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.verticalSpace,
                      Text(
                        topic,
                        style: AppTextStyles.text13PxMedium,
                      ),
                      15.verticalSpace,
                      const Divider(),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
