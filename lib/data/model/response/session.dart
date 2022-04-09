// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? tel,
    List<String>? roles,
    @JsonKey(name: 'permission_key_list') List<String>? permissionKeyList,
    String? idToken,
    String? refreshToken,
    String? accessToken,
  }) = _Session;

  static List<Session> toList(List<dynamic> json) =>
      json.map((value) => Session.fromJson(value)).toList();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
