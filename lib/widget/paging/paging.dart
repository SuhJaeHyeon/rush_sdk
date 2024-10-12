import 'package:epicone/core/util/list.dart';

class Paging<T> {
  Paging({
    required this.pageTotal,
    required this.pageCurrent,
    required this.limit,
    required this.list,
  });

  final int pageTotal;
  final int pageCurrent;
  final int limit;
  final List<T> list;

  factory Paging.empty(int limit) {
    return Paging(
      pageTotal: 1,
      pageCurrent: 1,
      limit: limit,
      list: [],
    );
  }

  bool get isFirst => pageTotal == 0 || pageCurrent == 1;
  bool get isLast => pageTotal == 0 || pageCurrent == pageTotal;
  bool get isEmpty => list.isEmpty;

  List<T> get listCurrent {
    var offset = (pageCurrent - 1) * limit;
    return list.sublistSafety(offset, offset + limit);
  }

  List<T> get listNext {
    var offset = pageCurrent * limit;
    return list.sublistSafety(offset, offset + limit);
  }

  bool get isNeedFetchNext => listNext.isEmpty && !isLast;

  Paging<T> prev() => copyWith(pageCurrent: pageCurrent - 1);
  Paging<T> next() => copyWith(pageCurrent: pageCurrent + 1);

  factory Paging.fromJson(
    Map<String, dynamic> json,
    T Function(Object) fromJson,
  ) {
    return Paging(
      pageTotal: json['page_total'],
      pageCurrent: json['page_current'],
      limit: json['limit'] ?? 6,
      list: List<Map<String, dynamic>>.from(json['list'] ?? [])
          .map(fromJson)
          .toList(),
    );
  }

  Paging<T> append(Paging<T> next) {
    return Paging(
      pageTotal: next.pageTotal,
      pageCurrent: next.pageCurrent,
      limit: limit,
      list: [...list, ...next.list],
    );
  }

  Paging<T> copyWith({
    int? pageTotal,
    int? pageCurrent,
    int? limit,
    List<T>? list,
  }) {
    return Paging(
      pageTotal: pageTotal ?? this.pageTotal,
      pageCurrent: pageCurrent ?? this.pageCurrent,
      limit: limit ?? this.limit,
      list: list ?? this.list,
    );
  }
}
