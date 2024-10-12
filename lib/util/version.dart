import 'package:rush_sdk/util/info.dart';
import 'package:hive/hive.dart';

part 'version.g.dart';

/// ## to compare two of versions
/// ```dart
/// // ex 1)
/// Version("1.8.9") < Version("1.8.10") // true
///
/// // ex 2)
/// Version.local() >= Version("1.8.6")
/// ```

@HiveType(typeId: 6)
class Version extends HiveObject {
  @HiveField(0)
  final String version;

  Version(this.version);

  factory Version.local() => Version(BundleInfo.shared.packageInfo.version);

  @override
  bool operator ==(covariant Version other) => version == other.version;

  @override
  int get hashCode => Object.hash(runtimeType, version);

  bool operator >=(covariant Version other) =>
      _op(other, (a, b) => a > b, true);

  bool operator <=(covariant Version other) =>
      _op(other, (a, b) => a < b, true);

  bool operator >(covariant Version other) =>
      _op(other, (a, b) => a > b, false);

  bool operator <(covariant Version other) =>
      _op(other, (a, b) => a < b, false);

  bool _op(
    Version other,
    bool Function(int a, int b) op,
    bool equal,
  ) {
    var mine = version.split(".").map(int.parse).toList();
    var others = other.version.split(".").map(int.parse).toList();

    for (var i = 0; i < mine.length; i++) {
      if (mine[i] == others[i]) continue;
      return op(mine[i], others[i]);
    }

    return equal;
  }

  @override
  String toString() => version;
}
