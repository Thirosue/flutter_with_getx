import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/custom_theme.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  void changeTheme(bool? toggle) {
    Get.changeTheme(
      Get.isDarkMode ? customTheme : ThemeData.dark(),
    );
  }
}
