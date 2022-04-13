import 'package:flutter/material.dart';

@immutable
class ValidateMessages {
  static const String required = '入力してください';
  static const String email = 'E-mailを入力してください';
  static String min(int length) => '$length文字以上で入力してください';
  static String max(int length) => '$length文字以下で入力してください';
}
