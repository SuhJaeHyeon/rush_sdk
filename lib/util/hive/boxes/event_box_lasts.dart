
import 'package:rush_sdk/util/hive/boxes/event_box.dart';

/// ## 최근 발생된 [RANGE_COUNT]만큼의 이벤트
class EventBoxLasts {
  static const RANGE_COUT = 10;
  final List<String> lasts = [];

  init(Map<String, EventBoxMeta> allValues) {
    final List<EventBoxItem> items = [];
    final List<String> distincted = [];
    for (var e in allValues.entries) {
      items.addAll(e.value.history);
    }

    items.sort((a, b) => -a.createdAt.compareTo(b.createdAt));

    for (var e in items) {
      if (distincted.lastOrNull != e.event) {
        distincted.add(e.event);
      }
    }

    lasts.addAll(distincted.take(10));
  }

  insert(EventBoxMeta meta) {
    var item = meta.history.first;
    if (lasts.firstOrNull != item.event) {
      lasts.insert(0, item.event);
      lasts.removeLast();
    }
  }
}
