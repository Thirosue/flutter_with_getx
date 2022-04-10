// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalState _$$_LocalStateFromJson(Map<String, dynamic> json) =>
    _$_LocalState(
      name: json['name'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$_LocalStateToJson(_$_LocalState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'roles': instance.roles,
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
