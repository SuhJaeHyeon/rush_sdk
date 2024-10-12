import 'package:rush_sdk/util/hive/hive.dart';
import 'package:hive/hive.dart';

class CycleItem {
  final String key;
  final String? next;

  const CycleItem(this.key, this.next);

  Map<String, dynamic> toJson() => {
        'key': key,
        'next': next,
      };
}

/// ## TBD: localDB 와 기능 융합
class CycleBox {
  static Future<CollectionBox<Map>> _getBox() async =>
      await EpiconeHive.shared.openBox<Map>(EpiconeHiveBox.CYCLE_BOX);

  static Future<bool> _existOrPut(CycleItem item) async {
    final box = await _getBox();
    final stored = await box.get(item.key);

    if (stored == null) {
      await box.put(item.key, item.toJson());
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> inviteCodePopup(String phone) async =>
      await _existOrPut(CycleItem("invite_code_popup_$phone", null));
}
