enum Flavor {
  prod,
  staging,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return '에픽원';
      case Flavor.staging:
        return '에픽원 스테이징';
      case Flavor.dev:
        return '에픽원 개발';
      default:
        return 'title';
    }
  }

}
