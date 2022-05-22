// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'local_state.freezed.dart';
part 'local_state.g.dart';

@freezed
class LocalState with _$LocalState {
  @HiveType(typeId: 0, adapterName: 'LocalStateAdapter')
  const factory LocalState({
    @HiveField(0) required String name,
    @HiveField(1) List<String>? roles,
    @HiveField(2) String? idToken,
    @HiveField(3) String? refreshToken,
    @HiveField(4) String? accessToken,
  }) = _LocalState;

  factory LocalState.fromJson(Map<String, dynamic> json) =>
      _$LocalStateFromJson(json);
}
