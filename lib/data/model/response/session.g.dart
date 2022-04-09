// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      tel: json['tel'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      permissionKeyList: (json['permission_key_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'tel': instance.tel,
      'roles': instance.roles,
      'permission_key_list': instance.permissionKeyList,
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
