typedef Where<E> = bool Function(E element);
typedef UpdateFn<E> = E Function(E target);
typedef UpdateOrFn<E> = E Function(E? target);

extension ListExtension<E> on List<E> {
  List<E> sublistSafety(int start, [int? end]) {
    if (start >= length) return [];

    return end == null || end <= length
        ? sublist(start, end)
        : sublist(start, length);
  }

  List<E> getRangeSafety(int start, int end) {
    if (start >= length) return [];

    return end <= length
        ? getRange(start, end).toList()
        : getRange(start, length).toList();
  }

  E? get firstOrNullVersionSafety {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }

  /// [ListView]에서 itemCount를 임의로 부여할 때 리스트의 길이를 넘는다면 리스트의 길이 값으로 재설정함
  int getItemCountSafety(int count) {
    return length < count ? length : count;
  }

  /// ## UPSERT: 있으면 UPDATE, 없으면 INSERT
  E merge(E newE) => mergeWhere((oldE) => newE, (e) => e == newE);

  /// ## UPSERT: 있으면 UPDATE, 없으면 INSERT
  E mergeWhere(UpdateOrFn<E> updateOrFn, Where<E> where) {
    int index = indexWhere(where);

    if (index == -1) {
      var inserted = updateOrFn(null);
      add(inserted);
      return inserted;
    } else {
      this[index] = updateOrFn(this[index]);
      return this[index];
    }
  }

  E? update(E element) => updateWhere((oldE) => element, (e) => e == element);

  E? updateWhere(UpdateFn<E> updateFn, Where<E> where) {
    int index = indexWhere(where);
    if (index != -1) {
      this[index] = updateFn(this[index]);
      return this[index];
    }
    return null;
  }

  void sortMulti(List<int Function(E, E)> compares) {
    sort((a, b) {
      int result = 0;
      for (var compare in compares) {
        result = compare(a, b);
        if (result != 0) return result;
      }
      return result;
    });
  }
  
  bool containsWhere(bool Function(E e) where) {
    for (var element in this) {
      if (where(element)) {
        return true;
      }
    }
    return false;
  }

  List<T> flat<T>() {
    final result = <T>[];
    for (var e in this) {
      if (e is Iterable<T>) {
        result.addAll(e);
      } else {
        result.add(e as T);
      }
    }

    return result;
  }
}

extension IterableExtension<E> on Iterable<E> {
  int sum(int Function(E e) propertyFn) => fold(0, (p, e) => p + propertyFn(e));
  double sumDouble(double Function(E e) propertyFn) =>
      fold(0.0, (p, e) => p + propertyFn(e));

  bool containsNot(Object? element) => !contains(element);

  List<MapEntry<E, int>> groupByCount(
    Function(E e) keyFn, {
    String? orderBy,
  }) {
    var map = <dynamic, Map<String, dynamic>>{};

    for (var e in this) {
      var key = keyFn(e);
      if (map.containsKey(key)) {
        map[key]!['count'] = map[key]!['count'] + 1;
      } else {
        map[key] = {
          'value': e,
          'count': 1,
        };
      }
    }

    var result = map.entries
        .map((e) => MapEntry<E, int>(e.value['value'], e.value['count']))
        .toList();

    if (orderBy != null) {
      var isAsc = orderBy.toLowerCase() == "asc";
      result.sort((a, b) => a.value.compareTo(b.value) * (isAsc ? 1 : -1));
    }

    return result;
  }
}
