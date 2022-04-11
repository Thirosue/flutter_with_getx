import 'package:get/utils.dart';

class Vaildators {
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    if (!GetUtils.isEmail(value)) {
      return 'E-mailを入力してください';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    if (value.length < 8) {
      return '8文字以上で入力してください';
    }
    return null;
  }
}
