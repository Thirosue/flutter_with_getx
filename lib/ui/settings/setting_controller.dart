import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  void changeTheme(bool? toggle) {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
