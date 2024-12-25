import 'package:introvertdiaries/src/core/base_model.dart';

typedef PaginationModelMapper<R> = R Function(Map<String, dynamic>);

class PaginationModel<R extends Object> extends BaseModel {
  const PaginationModel._({
    required this.records,
    required this.count,
    this.next,
    this.previous,
  });

  factory PaginationModel.from(
    PaginationModelMapper<R> mapper,
    Map<String, dynamic> map,
  ) {
    final records = List<Map<String, dynamic>>.from(
      map['results'] as List? ?? [],
    );

    return PaginationModel<R>._(
      next: _extractNextPageNumber(map['next'] as String?),
      previous: map['previous'] as String?,
      records: records.map(mapper).toList(growable: false),
      count: map['count'] as int,
    );
  }

  final List<R> records;
  final int? next;
  final String? previous;
  final int count;

  static int? _extractNextPageNumber(String? url) {
    if (url == null) return null;

    final regex = RegExp(r'[?&]p=(\d+)');
    final match = regex.firstMatch(url);
    if (match != null) return int.tryParse(match.group(1) ?? 'x');
    return null;
  }
}
