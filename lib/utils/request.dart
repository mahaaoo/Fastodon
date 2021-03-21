import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Request {
  static Future get({
    @required String url, 
    Map<String, dynamic> params = const {}, 
    Map header
  }) async {
    Dio dio = Request._createDio();
    if (header != null && header.isNotEmpty) {
      dio.options.headers = header;
    }
    var r;

    try {
      Response response = await dio.get(url, queryParameters: params);
      if (response.statusCode != 200) {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        _handleFail(errorMsg);
      } else {
        r = response.data;
      }
    } catch (exception) {
      _handleFail(exception.toString());
    }
    return r;
  }

  static Future post({
    @required String url, 
    Map<String, dynamic> data = const {},
    Map<String, dynamic> params = const {},
  }) async {
    Dio dio = Request._createDio();
    var r;

    try {
      Response response = await dio.post(url, queryParameters: params, data: data);
      if (response.statusCode != 200) {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        _handleFail(errorMsg);
      } else {
        r = response.data;
      }
    } catch (exception) {
      _handleFail(exception.toString());
    }
    return r;
  }

  static _handleFail(String error) {
  }

  static Dio _createDio() {
    var dio = new Dio();
    dio.options.connectTimeout = 5000;

    // dio拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options){
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
