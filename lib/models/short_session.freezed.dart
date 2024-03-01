// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'short_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShortSession _$ShortSessionFromJson(Map<String, dynamic> json) {
  return _ShortSession.fromJson(json);
}

/// @nodoc
mixin _$ShortSession {
  GameState get gameState => throw _privateConstructorUsedError;
  String? get guest_name => throw _privateConstructorUsedError;
  String get host_name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortSessionCopyWith<ShortSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortSessionCopyWith<$Res> {
  factory $ShortSessionCopyWith(
          ShortSession value, $Res Function(ShortSession) then) =
      _$ShortSessionCopyWithImpl<$Res, ShortSession>;
  @useResult
  $Res call(
      {GameState gameState,
      String? guest_name,
      String host_name,
      String id,
      String name});
}

/// @nodoc
class _$ShortSessionCopyWithImpl<$Res, $Val extends ShortSession>
    implements $ShortSessionCopyWith<$Res> {
  _$ShortSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
    Object? guest_name = freezed,
    Object? host_name = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      guest_name: freezed == guest_name
          ? _value.guest_name
          : guest_name // ignore: cast_nullable_to_non_nullable
              as String?,
      host_name: null == host_name
          ? _value.host_name
          : host_name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShortSessionImplCopyWith<$Res>
    implements $ShortSessionCopyWith<$Res> {
  factory _$$ShortSessionImplCopyWith(
          _$ShortSessionImpl value, $Res Function(_$ShortSessionImpl) then) =
      __$$ShortSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameState gameState,
      String? guest_name,
      String host_name,
      String id,
      String name});
}

/// @nodoc
class __$$ShortSessionImplCopyWithImpl<$Res>
    extends _$ShortSessionCopyWithImpl<$Res, _$ShortSessionImpl>
    implements _$$ShortSessionImplCopyWith<$Res> {
  __$$ShortSessionImplCopyWithImpl(
      _$ShortSessionImpl _value, $Res Function(_$ShortSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
    Object? guest_name = freezed,
    Object? host_name = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ShortSessionImpl(
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      guest_name: freezed == guest_name
          ? _value.guest_name
          : guest_name // ignore: cast_nullable_to_non_nullable
              as String?,
      host_name: null == host_name
          ? _value.host_name
          : host_name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShortSessionImpl implements _ShortSession {
  _$ShortSessionImpl(
      {this.gameState = GameState.NotStarted,
      this.guest_name,
      required this.host_name,
      this.id = "",
      this.name = ""});

  factory _$ShortSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShortSessionImplFromJson(json);

  @override
  @JsonKey()
  final GameState gameState;
  @override
  final String? guest_name;
  @override
  final String host_name;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ShortSession(gameState: $gameState, guest_name: $guest_name, host_name: $host_name, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortSessionImpl &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState) &&
            (identical(other.guest_name, guest_name) ||
                other.guest_name == guest_name) &&
            (identical(other.host_name, host_name) ||
                other.host_name == host_name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gameState, guest_name, host_name, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortSessionImplCopyWith<_$ShortSessionImpl> get copyWith =>
      __$$ShortSessionImplCopyWithImpl<_$ShortSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShortSessionImplToJson(
      this,
    );
  }
}

abstract class _ShortSession implements ShortSession {
  factory _ShortSession(
      {final GameState gameState,
      final String? guest_name,
      required final String host_name,
      final String id,
      final String name}) = _$ShortSessionImpl;

  factory _ShortSession.fromJson(Map<String, dynamic> json) =
      _$ShortSessionImpl.fromJson;

  @override
  GameState get gameState;
  @override
  String? get guest_name;
  @override
  String get host_name;
  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ShortSessionImplCopyWith<_$ShortSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
