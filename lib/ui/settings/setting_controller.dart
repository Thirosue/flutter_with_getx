import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/custom_theme.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SettingController extends GetxController {
  final _localAuth = LocalAuthentication();

  final on = false.obs;

  void changeTheme(bool? toggle) {
    Get.changeTheme(
      Get.isDarkMode ? lightTheme : darkTheme,
    );
    on.value = toggle!;
  }

  Future<bool> authenticate() async {
    bool result = false;

    List<BiometricType> availableBiometrics =
        await _localAuth.getAvailableBiometrics();

    try {
      if (availableBiometrics.contains(BiometricType.face) ||
          availableBiometrics.contains(BiometricType.fingerprint)) {
        final result =
            await _localAuth.authenticate(localizedReason: "認証してください");
        debugPrint(result.toString());
        if (result) {
          Get.snackbar(
            'Result',
            "Auth True... Change Email",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return result;
  }
}
