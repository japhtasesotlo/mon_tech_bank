import 'package:dio/dio.dart' hide Headers;

class ApiError implements Exception {
  int _errorCode;
  int get errorCode => _errorCode;
  String _errorMessage = "";
  String get message => _errorMessage;

  ApiError.fromDio(DioError error) {
    _handleError(error);
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.DEFAULT:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.RESPONSE:
        _errorCode = error.response.statusCode;
        _errorMessage =
        "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = "Receive timeout in send request";
        break;
      default:
        _errorMessage = "An API error occurred";
        break;
    }
    return _errorMessage;
  }
}