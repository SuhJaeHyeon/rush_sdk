import 'package:package_info_plus/package_info_plus.dart';

class BundleInfo {
  static late final BundleInfo shared;
  final PackageInfo packageInfo;

  BundleInfo(this.packageInfo);

  static init() async {
    shared = BundleInfo(await PackageInfo.fromPlatform());
  }
}
