import 'package:flutter/foundation.dart';

class NetworkDebugState {
  NetworkDebugState._();

  static final ValueNotifier<int?> lastStatusCode = ValueNotifier<int?>(null);
  static final ValueNotifier<String?> lastErrorMessage = ValueNotifier<String?>(null);

  static void setStatusCode(int? code) {
    lastStatusCode.value = code;
  }

  static void setError(String? message) {
    lastErrorMessage.value = message;
  }
}
