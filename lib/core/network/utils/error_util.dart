import 'package:flutter/foundation.dart';
import 'package:gharoghari/ui/ui_failure/ui_result.dart';
import 'base_response.dart';

class ErrorUtil {
  static UiFailure<T> getUiFailureFromException<T>(
      Object error, StackTrace stackTrace) {
    debugPrintStack(stackTrace: stackTrace);

    if (error is ApiError) {
      return UiFailure(error.type, error.code);
    }
    return const UiFailure(ErrorType.unknown, "UnKnow");
  }
}
