import 'package:dio/dio.dart';
import 'package:fastodon/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fastodon/public.dart';

class Request {
  static Future get({String url, Map params, Map header}) async {
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
      if (response.statusCode != 200) {
        var errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        showTotast(errorMsg);
      } else if (response.statusCode == 200 && response != null) {
        return response.data;
      }
    } catch (exception) {
      showTotast(exception.toString());
    }
  }

  static Future post({String url, Map params}) async {
    var dio = Request.createDio();
    try {
      Response response = await dio.post(url, data: params);
      if (response.statusCode != 200) {
        var errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        showTotast(errorMsg);
      } else if (response.statusCode == 200 && response != null) {
        return response.data;
      }
    } catch (exception) {
      showTotast(exception.toString());
    }
  }

  static void showTotast(String errorMsg) {
    Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: MyColor.error,
      textColor: MyColor.loginWhite,
      fontSize: 16.0
    );
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
        print('收到了json信息');
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
