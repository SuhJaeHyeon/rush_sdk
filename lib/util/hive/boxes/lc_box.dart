// ignore_for_file: constant_identifier_names

import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

class LCItem {
  final String country;
  final String language;

  const LCItem(this.country, this.language);

  Map<String, dynamic> toJson() => {
        'country': country,
        'language': language,
      };
}

class LCBox {
  static const String LC_KEY = "lc";

  static Future<CollectionBox<Map>> _getBox() async =>
      await EpiconeHive.shared.openBox<Map>(EpiconeHiveBox.LC_BOX);

  static Future<LCItem?> getLC() async {
    final box = await _getBox();
    final item = await box.get(LC_KEY);
    return item == null ? null : LCItem(item["country"], item["language"]);
  }

  static Future<void> setLC(LCItem item) async {
    final box = await _getBox();
    await box.put(LC_KEY, item.toJson());
  }

  static Future<void> clear() async {
    final box = await _getBox();
    await box.clear();
  }
}
