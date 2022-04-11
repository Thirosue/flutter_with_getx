// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String tel,
  }) = _User;

  static List<User> toList(List<dynamic> json) =>
      json.map((value) => User.fromJson(value)).toList();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
