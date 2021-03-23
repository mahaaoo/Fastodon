import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'request_error.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) {
    // error统一处理
    RequestError appException = RequestError.create(err);
    // 错误提示
    debugPrint('DioError===: ${appException.toString()}');
    err.error = appException;
    return super.onError(err);
  }
}
