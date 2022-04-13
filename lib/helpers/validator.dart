class Vaildators {
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
