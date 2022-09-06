enum ErrorType { timeout, noConnection, apiFailure, localError, unknown }

class ErrorCodesFromApi {
  // static const String INVALID_CREDENTIALS = "invalid-credentials";
}

String getMessageFromErrorType(ErrorType type, String? code) {
  switch (type) {
    case ErrorType.timeout:
      return "Timeout error occurred, please try again";
    case ErrorType.noConnection:
      return "Could not connect to the server, please check your network";
    case ErrorType.apiFailure:
      switch (code) {
        default:
          return "Some error occurred, please try again";
      }
    case ErrorType.localError:
      return "Some error occurred, please try again";
    default:
      return "Unknown error occurred, please try again";
  }
}

class ApiError {
  final ErrorType type;
  final String code;
  final String message;

  ApiError(this.type, {this.code = "", this.message = ""});
}

class ApiResponse<T> {
  final T data;

  ApiResponse(this.data);
}

class RawError {
  late String code;
  late String msg;

  RawError({required this.code, required this.msg});

  RawError.fromJson(Map<String, dynamic> json) {
    code = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = code;
    data['msg'] = msg;
    return data;
  }
}

class RawResponse {
  dynamic data;
  RawError? error;

  RawResponse({this.data, this.error});

  RawResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    error = json['error'] != null ? RawError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['data'] = this.data;
    if (error != null) {
      data['error'] = error?.toJson();
    }
    return data;
  }

  bool get isSuccess => error == null;
}
