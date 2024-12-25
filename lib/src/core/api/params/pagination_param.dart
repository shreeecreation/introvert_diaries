
class PaginationParam {
  const PaginationParam({required this.page});

  final int page;

  Map<String, int> toMap() => {'page': page};
}
