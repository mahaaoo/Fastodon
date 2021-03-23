import 'package:dio/dio.dart';

class RequestError implements Exception {
  final String message;
  final int code;

  RequestError([
    this.code,
    this.message,
  ]);

  String toString() {
    return "$code$message";
  }

  factory RequestError.create(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return BadRequestException(-1, "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return BadRequestException(-1, "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return BadRequestException(-1, "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return BadRequestException(-1, "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "请求语法错误");
                }
                break;
              case 401:
                {
                  return UnauthorisedException(errCode, "没有权限");
                }
                break;
              case 403:
                {
                  return UnauthorisedException(errCode, "服务器拒绝执行");
                }
                break;
              case 404:
                {
                  return UnauthorisedException(errCode, "无法连接服务器");
                }
                break;
              case 405:
                {
                  return UnauthorisedException(errCode, "请求方法被禁止");
                }
                break;
              case 500:
                {
                  return UnauthorisedException(errCode, "服务器内部错误");
                }
                break;
              case 502:
                {
                  return UnauthorisedException(errCode, "无效的请求");
                }
                break;
              case 503:
                {
                  return UnauthorisedException(errCode, "服务器挂了");
                }
                break;
              case 505:
                {
                  return UnauthorisedException(errCode, "不支持HTTP协议请求");
                }
                break;
              default:
                {
                  return RequestError(errCode, error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            return RequestError(-1, "未知错误");
          }
        }
        break;
      default:
        {
          return RequestError(-1, error.message);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends RequestError {
  BadRequestException([int code, String message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends RequestError {
  UnauthorisedException([int code, String message]) : super(code, message);
}
