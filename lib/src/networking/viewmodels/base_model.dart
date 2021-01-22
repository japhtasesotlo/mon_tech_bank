import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mon_tech_bank/src/common/enums.dart';
import 'package:mon_tech_bank/src/networking/utils/api_error.dart';

class BaseViewModel<T> extends ChangeNotifier {
  Exception _exception;
  Exception get exception => _exception;
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  T _data;
  T get data => _data;

  void setState(ViewState viewState) {
    if (viewState != null) {
      _state = viewState;
    }
    notifyListeners();
  }

  void setData(T data, ViewState state) {
    this._data = data;
    setState(state);
  }

  void setDataWithNoState(T data) {
    this._data = data;
    notifyListeners();
  }

  void setException(Exception error, ViewState state) {
    if (error is DioError) {
      this._exception = ApiError.fromDio(error);
    } else {
      this._exception = error;
    }
    setState(state);
  }
}
