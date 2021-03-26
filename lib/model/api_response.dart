import 'package:fastodon/utils/request/request_error.dart';

enum Status { 
  COMPLETED, 
  ERROR
}

class ApiResponse<T> implements Exception {
  Status status;
  T data;
  RequestError exception;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.exception) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $exception \n Data : $data";
  }
}

