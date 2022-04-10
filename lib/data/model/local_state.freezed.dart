// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'local_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalState _$LocalStateFromJson(Map<String, dynamic> json) {
  return _LocalState.fromJson(json);
}

/// @nodoc
class _$LocalStateTearOff {
  const _$LocalStateTearOff();

  _LocalState call(
      {required String name,
      List<String>? roles,
      String? idToken,
      String? refreshToken,
      String? accessToken}) {
    return _LocalState(
      name: name,
      roles: roles,
      idToken: idToken,
      refreshToken: refreshToken,
      accessToken: accessToken,
    );
  }

  LocalState fromJson(Map<String, Object?> json) {
    return LocalState.fromJson(json);
  }
}

/// @nodoc
const $LocalState = _$LocalStateTearOff();

/// @nodoc
mixin _$LocalState {
  String get name => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalStateCopyWith<LocalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalStateCopyWith<$Res> {
  factory $LocalStateCopyWith(
          LocalState value, $Res Function(LocalState) then) =
      _$LocalStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      List<String>? roles,
      String? idToken,
      String? refreshToken,
      String? accessToken});
}

/// @nodoc
class _$LocalStateCopyWithImpl<$Res> implements $LocalStateCopyWith<$Res> {
  _$LocalStateCopyWithImpl(this._value, this._then);

  final LocalState _value;
  // ignore: unused_field
  final $Res Function(LocalState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? roles = freezed,
    Object? idToken = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocalStateCopyWith<$Res> implements $LocalStateCopyWith<$Res> {
  factory _$LocalStateCopyWith(
          _LocalState value, $Res Function(_LocalState) then) =
      __$LocalStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      List<String>? roles,
      String? idToken,
      String? refreshToken,
      String? accessToken});
}

/// @nodoc
class __$LocalStateCopyWithImpl<$Res> extends _$LocalStateCopyWithImpl<$Res>
    implements _$LocalStateCopyWith<$Res> {
  __$LocalStateCopyWithImpl(
      _LocalState _value, $Res Function(_LocalState) _then)
      : super(_value, (v) => _then(v as _LocalState));

  @override
  _LocalState get _value => super._value as _LocalState;

  @override
  $Res call({
    Object? name = freezed,
    Object? roles = freezed,
    Object? idToken = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_LocalState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalState with DiagnosticableTreeMixin implements _LocalState {
  const _$_LocalState(
      {required this.name,
      this.roles,
      this.idToken,
      this.refreshToken,
      this.accessToken});

  factory _$_LocalState.fromJson(Map<String, dynamic> json) =>
      _$$_LocalStateFromJson(json);

  @override
  final String name;
  @override
  final List<String>? roles;
  @override
  final String? idToken;
  @override
  final String? refreshToken;
  @override
  final String? accessToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalState(name: $name, roles: $roles, idToken: $idToken, refreshToken: $refreshToken, accessToken: $accessToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('roles', roles))
      ..add(DiagnosticsProperty('idToken', idToken))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('accessToken', accessToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.roles, roles) &&
            const DeepCollectionEquality().equals(other.idToken, idToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(roles),
      const DeepCollectionEquality().hash(idToken),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$LocalStateCopyWith<_LocalState> get copyWith =>
      __$LocalStateCopyWithImpl<_LocalState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalStateToJson(this);
  }
}

abstract class _LocalState implements LocalState {
  const factory _LocalState(
      {required String name,
      List<String>? roles,
      String? idToken,
      String? refreshToken,
      String? accessToken}) = _$_LocalState;

  factory _LocalState.fromJson(Map<String, dynamic> json) =
      _$_LocalState.fromJson;

  @override
  String get name;
  @override
  List<String>? get roles;
  @override
  String? get idToken;
  @override
  String? get refreshToken;
  @override
  String? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$LocalStateCopyWith<_LocalState> get copyWith =>
      throw _privateConstructorUsedError;
}
