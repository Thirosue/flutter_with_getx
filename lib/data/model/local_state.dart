// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_state.freezed.dart';
part 'local_state.g.dart';

@freezed
class LocalState with _$LocalState {
  const factory LocalState({
    required String name,
    List<String>? roles,
    String? idToken,
    String? refreshToken,
    String? accessToken,
  }) = _LocalState;

  factory LocalState.fromJson(Map<String, dynamic> json) =>
      _$LocalStateFromJson(json);
}
