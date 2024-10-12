// ignore_for_file: constant_identifier_names

import 'package:rush_sdk/util/hive/boxes/event_box_lasts.dart';
import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

part 'event_box.g.dart';

class EventBox {
  static const EVENT_PUSH_AGREE = 'push_agree';
  static const EVENT_SESSION_START = 'epicone_session_start';
  static final EventBoxLasts lasts = EventBoxLasts();

  static init() async => lasts.init(await (await _getBox()).getAllValues());

  static Future<CollectionBox<EventBoxMeta>> _getBox() async =>
      await EpiconeHive.shared.openBox<EventBoxMeta>(EpiconeHiveBox.EVENT_BOX);

  static Future<void> clear([String? event]) async {
    final box = await _getBox();

    if (event == null) {
      await box.clear();
    } else {
      await box.delete(event);
    }
  }

  static Future<void> log(String event, {Map<String, dynamic>? data}) async {
    final box = await _getBox();
    final meta = await box.get(event);
    final metaNew =
        meta == null ? EventBoxMeta.newOne(event, data) : meta.add(event, data);
    lasts.insert(metaNew);
    await box.put(event, metaNew);
  }

  static Future<EventBoxMeta?> get(String event) async {
    final box = await _getBox();
    return await box.get(event);
  }

  static Future<List<EventBoxMeta>> allEvents() async {
    final box = await _getBox();
    final allValues = await box.getAllValues();

    return [...allValues.values]
      ..sort((a, b) => -a.updatedAt.compareTo(b.updatedAt));
  }

  static Future<int> count(String event) async {
    final meta = await get(event);
    return meta == null ? 0 : meta.count;
  }
}

@HiveType(typeId: 0)
class EventBoxMeta extends HiveObject {
  @HiveField(0)
  final String event;
  @HiveField(1)
  final int count;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final DateTime updatedAt;
  @HiveField(4)
  final List<EventBoxItem> history;

  EventBoxMeta({
    required this.event,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
    required this.history,
  });

  factory EventBoxMeta.newOne(String event, Map<String, dynamic>? data) {
    var now = DateTime.now();
    return EventBoxMeta(
      event: event,
      count: 1,
      createdAt: now,
      updatedAt: now,
      history: [
        EventBoxItem(
          event: event,
          createdAt: now,
          data: data,
        ),
      ],
    );
  }

  EventBoxMeta add(String event, Map<String, dynamic>? data) {
    var now = DateTime.now();
    return EventBoxMeta(
      event: this.event,
      count: count + 1,
      createdAt: createdAt,
      updatedAt: now,
      history: [
        EventBoxItem(
          event: event,
          createdAt: now,
          data: data,
        ),
        ...history,
      ],
    );
  }

  List<EventBoxItem> historyFrom(DateTime from) =>
      history.where((h) => h.createdAt.isAfter(from)).toList();

  List<EventBoxItem> historyFromDuration(Duration duration) =>
      historyFrom(DateTime.now().subtract(duration));
}

@HiveType(typeId: 1)
class EventBoxItem extends HiveObject {
  @HiveField(0)
  final String event;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final Map<String, dynamic>? data;

  EventBoxItem({
    required this.event,
    required this.createdAt,
    required this.data,
  });

  bool isExist(List<String> fields) {
    if (data == null) return false;
    for (var f in fields) {
      if (!data!.containsKey(f)) return false;
    }

    return true;
  }

  dynamic operator [](String field) => data?[field];

  @override
  String toString() {
    return event;
  }
}
