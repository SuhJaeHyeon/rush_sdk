import 'package:graphql/client.dart';
import 'package:rush_sdk/util/hive/boxes/event_box.dart';
import 'package:rush_sdk/util/version.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

enum EpiconeHiveBox {
  GRAPHQL_CACHE_BOX("GraphqlCacheBox"),
  RECENTLY_SEARCHED_BOX("RecentlySearchedBox"),
  EVENT_BOX("EventBox"),
  CYCLE_BOX("CycleBox"),
  USER_NOTIFICATION_BOX("UserNotificationBox"),
  LC_BOX("LCBox"),
  LANG_BOX("LangBox"),
  LOCAL_BOX("LocalBox");

  final String boxName; 
  const EpiconeHiveBox(this.boxName);
}

class EpiconeHive {
  // collections & boxies
  static const COLLECTION = "EpiconeHiveCollection";

  late final HiveStore hiveStore;
  late final BoxCollection boxCollection;
  static final shared = EpiconeHive();

  open() async {
    var directory = await getApplicationDocumentsDirectory();
    boxCollection = await BoxCollection.open(
      COLLECTION,
      {...EpiconeHiveBox.values.map((e) => e.boxName)},
      path: "${directory.path}//",
    );

    Hive.registerAdapter(EventBoxMetaAdapter());
    Hive.registerAdapter(EventBoxItemAdapter());
    Hive.registerAdapter(VersionAdapter());
    hiveStore = await _getHiveStore();
  }

  Future<HiveStore> _getHiveStore() async {
    var directory = await getApplicationDocumentsDirectory();
    return await HiveStore.open(path: directory.path);
  }

  Future<CollectionBox<T>> openBox<T>(EpiconeHiveBox box) async {
    return await boxCollection.openBox<T>(box.boxName);
  }
}
