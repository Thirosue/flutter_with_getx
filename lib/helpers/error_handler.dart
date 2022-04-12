import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ErrorHandler {
  static Widget onError(String? error) {
    debugPrint(error.toString());
    EasyLoading.showError(
      error.toString(),
      duration: const Duration(
        seconds: 30,
      ),
      dismissOnTap: true,
    );
    return const SizedBox.shrink();
  }
}
