// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'c_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CCard _$CCardFromJson(Map<String, dynamic> json) {
  return _CCard.fromJson(json);
}

/// @nodoc
mixin _$CCard {
  int get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get cardNumber => throw _privateConstructorUsedError;
  String? get campany => throw _privateConstructorUsedError;
  Validity? get validity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CCardCopyWith<CCard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CCardCopyWith<$Res> {
  factory $CCardCopyWith(CCard value, $Res Function(CCard) then) =
      _$CCardCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? type,
      String? name,
      String? cardNumber,
      String? campany,
      Validity? validity});

  $ValidityCopyWith<$Res>? get validity;
}

/// @nodoc
class _$CCardCopyWithImpl<$Res> implements $CCardCopyWith<$Res> {
  _$CCardCopyWithImpl(this._value, this._then);

  final CCard _value;
  // ignore: unused_field
  final $Res Function(CCard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? cardNumber = freezed,
    Object? campany = freezed,
    Object? validity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      campany: campany == freezed
          ? _value.campany
          : campany // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: validity == freezed
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as Validity?,
    ));
  }

  @override
  $ValidityCopyWith<$Res>? get validity {
    if (_value.validity == null) {
      return null;
    }

    return $ValidityCopyWith<$Res>(_value.validity!, (value) {
      return _then(_value.copyWith(validity: value));
    });
  }
}

/// @nodoc
abstract class _$$_CCardCopyWith<$Res> implements $CCardCopyWith<$Res> {
  factory _$$_CCardCopyWith(_$_CCard value, $Res Function(_$_CCard) then) =
      __$$_CCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? type,
      String? name,
      String? cardNumber,
      String? campany,
      Validity? validity});

  @override
  $ValidityCopyWith<$Res>? get validity;
}

/// @nodoc
class __$$_CCardCopyWithImpl<$Res> extends _$CCardCopyWithImpl<$Res>
    implements _$$_CCardCopyWith<$Res> {
  __$$_CCardCopyWithImpl(_$_CCard _value, $Res Function(_$_CCard) _then)
      : super(_value, (v) => _then(v as _$_CCard));

  @override
  _$_CCard get _value => super._value as _$_CCard;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? cardNumber = freezed,
    Object? campany = freezed,
    Object? validity = freezed,
  }) {
    return _then(_$_CCard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      campany: campany == freezed
          ? _value.campany
          : campany // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: validity == freezed
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as Validity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CCard with DiagnosticableTreeMixin implements _CCard {
  const _$_CCard(
      {required this.id,
      this.type,
      this.name,
      this.cardNumber,
      this.campany,
      this.validity});

  factory _$_CCard.fromJson(Map<String, dynamic> json) =>
      _$$_CCardFromJson(json);

  @override
  final int id;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? cardNumber;
  @override
  final String? campany;
  @override
  final Validity? validity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CCard(id: $id, type: $type, name: $name, cardNumber: $cardNumber, campany: $campany, validity: $validity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CCard'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('cardNumber', cardNumber))
      ..add(DiagnosticsProperty('campany', campany))
      ..add(DiagnosticsProperty('validity', validity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CCard &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.cardNumber, cardNumber) &&
            const DeepCollectionEquality().equals(other.campany, campany) &&
            const DeepCollectionEquality().equals(other.validity, validity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(cardNumber),
      const DeepCollectionEquality().hash(campany),
      const DeepCollectionEquality().hash(validity));

  @JsonKey(ignore: true)
  @override
  _$$_CCardCopyWith<_$_CCard> get copyWith =>
      __$$_CCardCopyWithImpl<_$_CCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CCardToJson(this);
  }
}

abstract class _CCard implements CCard {
  const factory _CCard(
      {required final int id,
      final String? type,
      final String? name,
      final String? cardNumber,
      final String? campany,
      final Validity? validity}) = _$_CCard;

  factory _CCard.fromJson(Map<String, dynamic> json) = _$_CCard.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get cardNumber => throw _privateConstructorUsedError;
  @override
  String? get campany => throw _privateConstructorUsedError;
  @override
  Validity? get validity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CCardCopyWith<_$_CCard> get copyWith =>
      throw _privateConstructorUsedError;
}

Validity _$ValidityFromJson(Map<String, dynamic> json) {
  return _Validity.fromJson(json);
}

/// @nodoc
mixin _$Validity {
  int get validThruMonth => throw _privateConstructorUsedError;
  int get validThruYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidityCopyWith<Validity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidityCopyWith<$Res> {
  factory $ValidityCopyWith(Validity value, $Res Function(Validity) then) =
      _$ValidityCopyWithImpl<$Res>;
  $Res call({int validThruMonth, int validThruYear});
}

/// @nodoc
class _$ValidityCopyWithImpl<$Res> implements $ValidityCopyWith<$Res> {
  _$ValidityCopyWithImpl(this._value, this._then);

  final Validity _value;
  // ignore: unused_field
  final $Res Function(Validity) _then;

  @override
  $Res call({
    Object? validThruMonth = freezed,
    Object? validThruYear = freezed,
  }) {
    return _then(_value.copyWith(
      validThruMonth: validThruMonth == freezed
          ? _value.validThruMonth
          : validThruMonth // ignore: cast_nullable_to_non_nullable
              as int,
      validThruYear: validThruYear == freezed
          ? _value.validThruYear
          : validThruYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ValidityCopyWith<$Res> implements $ValidityCopyWith<$Res> {
  factory _$$_ValidityCopyWith(
          _$_Validity value, $Res Function(_$_Validity) then) =
      __$$_ValidityCopyWithImpl<$Res>;
  @override
  $Res call({int validThruMonth, int validThruYear});
}

/// @nodoc
class __$$_ValidityCopyWithImpl<$Res> extends _$ValidityCopyWithImpl<$Res>
    implements _$$_ValidityCopyWith<$Res> {
  __$$_ValidityCopyWithImpl(
      _$_Validity _value, $Res Function(_$_Validity) _then)
      : super(_value, (v) => _then(v as _$_Validity));

  @override
  _$_Validity get _value => super._value as _$_Validity;

  @override
  $Res call({
    Object? validThruMonth = freezed,
    Object? validThruYear = freezed,
  }) {
    return _then(_$_Validity(
      validThruMonth: validThruMonth == freezed
          ? _value.validThruMonth
          : validThruMonth // ignore: cast_nullable_to_non_nullable
              as int,
      validThruYear: validThruYear == freezed
          ? _value.validThruYear
          : validThruYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Validity with DiagnosticableTreeMixin implements _Validity {
  const _$_Validity(
      {required this.validThruMonth, required this.validThruYear});

  factory _$_Validity.fromJson(Map<String, dynamic> json) =>
      _$$_ValidityFromJson(json);

  @override
  final int validThruMonth;
  @override
  final int validThruYear;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Validity(validThruMonth: $validThruMonth, validThruYear: $validThruYear)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Validity'))
      ..add(DiagnosticsProperty('validThruMonth', validThruMonth))
      ..add(DiagnosticsProperty('validThruYear', validThruYear));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Validity &&
            const DeepCollectionEquality()
                .equals(other.validThruMonth, validThruMonth) &&
            const DeepCollectionEquality()
                .equals(other.validThruYear, validThruYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(validThruMonth),
      const DeepCollectionEquality().hash(validThruYear));

  @JsonKey(ignore: true)
  @override
  _$$_ValidityCopyWith<_$_Validity> get copyWith =>
      __$$_ValidityCopyWithImpl<_$_Validity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidityToJson(this);
  }
}

abstract class _Validity implements Validity {
  const factory _Validity(
      {required final int validThruMonth,
      required final int validThruYear}) = _$_Validity;

  factory _Validity.fromJson(Map<String, dynamic> json) = _$_Validity.fromJson;

  @override
  int get validThruMonth => throw _privateConstructorUsedError;
  @override
  int get validThruYear => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ValidityCopyWith<_$_Validity> get copyWith =>
      throw _privateConstructorUsedError;
}
