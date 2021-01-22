
abstract class ApiHeaderKeys {
  static const String appAuth = 'Authorization';
}

abstract class MockServerConstants {
  static const String defaultUserId = 'c0b747de-8dfc-457f-998d-c2efa805d1f2';
  static const String accountListId = '4083bf56-f7a3-45d6-a6e0-c4f05889a393';
}


class NetworkHelper {

  static const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 30);
  static const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 30);

  NetworkHelper();

  Map<String, dynamic> getAuthHeader() {
    Map<String, dynamic> authHeader = new Map<String, dynamic>();
    authHeader[ApiHeaderKeys.appAuth.toString()] = getUserAccessToken();
    return authHeader;
  }

  String getUserAccessToken() {
    return "access_token";
  }
}
