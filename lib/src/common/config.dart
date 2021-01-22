enum Flavor {
  DEV,
  PROD,
  QA,
}

class Config {
  static Flavor appFlavor;

  static String get appName {
    switch (appFlavor) {
      case Flavor.DEV: // dev flavor
        return 'Mon Tech Bank - DEV';
      case Flavor.QA: // qa flavor
        return 'Mon Tech Bank - QA';
      default: // prod flavor
        return 'Mon Tech Bank - PROD'; //oh well
    }
  }

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'http://dev-mon-tech-bank-.ams1.cloud:8002/m/v1';
      case Flavor.QA:
        return 'https://qa-mon-tech-bank-default-rtdb.firebaseio.com/api';
      default:
        return 'http://mockbin.org/bin/';
    }
  }
}
