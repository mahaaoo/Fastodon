import 'package:dio/dio.dart';
import 'package:fastodon/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fastodon/public.dart';

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
      Response response = await dio.get(url);
      _handleResponse(callBack, response, errorCallBack);
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  static void post({String url, Map params, Function callBack,
      Function errorCallBack}) async {
    var dio = Request.createDio();
    print(params);
    try {
      Response response = await dio.post(url, data: params);
      _handleResponse(callBack, response, errorCallBack);
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  static void _handleResponse(Function callBack, Response response, Function errorCallBack) {
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
    Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: MyColor.error,
      textColor: MyColor.loginWhite,
      fontSize: 16.0
    );
    print("<net> errorMsg :" + errorMsg);
  }

  static Dio createDio() {
    var dio = new Dio();

    User user = new User();
    String userHeader = user.getToken();
    String urlHost = user.getHost();

    if (userHeader !=null || urlHost !=null) {
      dio.options.headers = {
        'Authorization' : userHeader
      };
      dio.options.baseUrl = urlHost;
    }
    // dio拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options){
        print(options.uri);
        return options; //continue
      },
      onResponse:(Response response) {
        return response; // continue
      },
      onError: (DioError e) {
        // 当请求失败时做一些预处理
        return e;//continue
      }
    ));

    return dio;
  }
}
