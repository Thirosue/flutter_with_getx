// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStateAdapter extends TypeAdapter<_$_LocalState> {
  @override
  final int typeId = 0;

  @override
  _$_LocalState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LocalState(
      name: fields[0] as String,
      roles: (fields[1] as List?)?.cast<String>(),
      idToken: fields[2] as String?,
      refreshToken: fields[3] as String?,
      accessToken: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LocalState obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.roles)
      ..writeByte(2)
      ..write(obj.idToken)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
