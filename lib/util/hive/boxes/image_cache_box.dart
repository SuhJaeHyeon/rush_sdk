// ignore_for_file: non_constant_identifier_names

import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

/// ## 잡탕
class LocalBox {
  static String KEY_IMAGE_CACHE = "key_image_cache";

  static Future<CollectionBox<String>> _getBox() async =>
      await EpiconeHive.shared.openBox<String>(EpiconeHiveBox.LOCAL_BOX);

  static Future<String?> getCacheKey() async {
    var box = await _getBox();
    return await box.get(KEY_IMAGE_CACHE);
  }

  static Future<void> putCacheKey(String value) async {
    var box = await _getBox();
    return await box.put(KEY_IMAGE_CACHE, value);
  }
}
