import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

/// ## TBD
class RecentlySearchedBox {
  static Future<CollectionBox<List<String>>> getBox() async =>
      await EpiconeHive.shared
          .openBox<List<String>>(EpiconeHiveBox.RECENTLY_SEARCHED_BOX);
}
