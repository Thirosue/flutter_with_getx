// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_card.freezed.dart';
part 'c_card.g.dart';

@freezed
class CCard with _$CCard {
  const factory CCard({
    required int id,
    String? type,
    String? name,
    String? cardNumber,
    String? campany,
    Validity? validity,
  }) = _CCard;

  static List<CCard> toList(List<dynamic> json) =>
      json.map((value) => CCard.fromJson(value)).toList();

  factory CCard.fromJson(Map<String, dynamic> json) => _$CCardFromJson(json);
}

@freezed
class Validity with _$Validity {
  const factory Validity({
    required int validThruMonth,
    required int validThruYear,
  }) = _Validity;

  factory Validity.fromJson(Map<String, dynamic> json) =>
      _$ValidityFromJson(json);
}
