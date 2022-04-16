// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CCard _$$_CCardFromJson(Map<String, dynamic> json) => _$_CCard(
      id: json['id'] as int,
      type: json['type'] as String?,
      name: json['name'] as String?,
      cardNumber: json['cardNumber'] as String?,
      campany: json['campany'] as String?,
      validity: json['validity'] == null
          ? null
          : Validity.fromJson(json['validity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CCardToJson(_$_CCard instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'campany': instance.campany,
      'validity': instance.validity,
    };

_$_Validity _$$_ValidityFromJson(Map<String, dynamic> json) => _$_Validity(
      validThruMonth: json['validThruMonth'] as int,
      validThruYear: json['validThruYear'] as int,
    );

Map<String, dynamic> _$$_ValidityToJson(_$_Validity instance) =>
    <String, dynamic>{
      'validThruMonth': instance.validThruMonth,
      'validThruYear': instance.validThruYear,
    };
