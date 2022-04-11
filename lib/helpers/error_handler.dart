import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static Widget onError(String? error) {
    debugPrint(error.toString());
    const title = 'システムエラー';
    var message = error.toString();
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
    return const SizedBox.shrink();
  }
}
