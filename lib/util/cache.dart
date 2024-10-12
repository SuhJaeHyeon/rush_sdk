import 'package:rush_sdk/util/hive/boxes/image_cache_box.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheController {
  static emptyCache(String key) async {
    var localKey = await LocalBox.getCacheKey();
    if (localKey != null && localKey != key) {
      await ImageCacheManager.instance.emptyCache();
    }
    await LocalBox.putCacheKey(key);
  }
}

class ImageCacheManager {
  static const key = "image_cache_manager";
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 200,
    ),
  );
}
