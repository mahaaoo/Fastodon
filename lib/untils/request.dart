import 'package:dio/dio.dart';
import 'local_storage.dart';
import 'package:fastodon/constant/storage_key.dart';

class Request {
  static void get({String url, Function callBack,
      Map params, Function errorCallBack, Map header}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    var dio = Request.createDio();
    if (header != null && header.isNotEmpty) {
      dio.options.headers = header;
    }
    try {
      Response<Map>response = await dio.get(url);
      _handleResponse(callBack, response, errorCallBack);
    } catch (exception) {
      print(exception);
      _handError(errorCallBack, exception.toString());
    }
  }

  static void post({String url, Map params, Function callBack,
      Function errorCallBack}) async {
    FormData formData = new FormData();
    params.forEach((key,value) {
      formData.add(key, value);
    });
    var dio = Request.createDio();
    try {
      Response<Map> response = await dio.post(url, data: formData);
      _handleResponse(callBack, response, errorCallBack);
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  static void _handleResponse(Function callBack, Response<Map> response, Function errorCallBack) {
      int statusCode = response.statusCode;
      String errorMsg = "";
      //处理错误部分
      if (statusCode != 200) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }
  }

  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }

  static Dio createDio() {
    return Dio();
  }
}
