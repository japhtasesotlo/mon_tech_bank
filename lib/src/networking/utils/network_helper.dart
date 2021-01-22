import 'package:flutter/widgets.dart';

abstract class ApiHeaderKeys {
  static const String appAuth = 'Authorization';
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
