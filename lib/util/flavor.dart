import 'package:rush_sdk/flavors.dart';

class FlavorProvider {
  Flavor get flavor => F.appFlavor ?? Flavor.dev;
  bool get isProd => flavor == Flavor.prod;
  bool get isStaging => flavor == Flavor.staging;
  bool get isDev => flavor == Flavor.dev;

  static final FlavorProvider _instance = FlavorProvider._internal();

  factory FlavorProvider() {
    return _instance;
  }

  FlavorProvider._internal();
}
