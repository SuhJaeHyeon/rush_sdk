// ignore_for_file: constant_identifier_names

import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

class UserNotificationBox {
  static const KEY_READ_IDS = "key_read_ids";

  static Future<CollectionBox<List<String>>> _getBox() async =>
      await EpiconeHive.shared
          .openBox<List<String>>(EpiconeHiveBox.USER_NOTIFICATION_BOX);

  static Future<void> read(List<String> userNotificationIds) async {
    final box = await _getBox();
    return box.put(KEY_READ_IDS, userNotificationIds);
  }

  static Future<List<String>> readedIds() async {
    final box = await _getBox();
    return await box.get(KEY_READ_IDS) ?? [];
  }
}
