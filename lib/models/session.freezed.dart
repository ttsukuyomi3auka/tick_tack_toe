// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) {
  return _SessionResponse.fromJson(json);
}

/// @nodoc
mixin _$SessionResponse {
  Map<String, dynamic>? get board => throw _privateConstructorUsedError;
  GameState get gameState => throw _privateConstructorUsedError;
  String? get guestName => throw _privateConstructorUsedError;
  List<String> get history => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionResponseCopyWith<SessionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionResponseCopyWith<$Res> {
  factory $SessionResponseCopyWith(
          SessionResponse value, $Res Function(SessionResponse) then) =
      _$SessionResponseCopyWithImpl<$Res, SessionResponse>;
  @useResult
  $Res call(
      {Map<String, dynamic>? board,
      GameState gameState,
      String? guestName,
      List<String> history,
      String hostName,
      String id,
      String name});
}

/// @nodoc
class _$SessionResponseCopyWithImpl<$Res, $Val extends SessionResponse>
    implements $SessionResponseCopyWith<$Res> {
  _$SessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = freezed,
    Object? gameState = null,
    Object? guestName = freezed,
    Object? history = null,
    Object? hostName = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SessionResponseImplCopyWith<$Res>
    implements $SessionResponseCopyWith<$Res> {
  factory _$$SessionResponseImplCopyWith(_$SessionResponseImpl value,
          $Res Function(_$SessionResponseImpl) then) =
      __$$SessionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic>? board,
      GameState gameState,
      String? guestName,
      List<String> history,
      String hostName,
      String id,
      String name});
}

/// @nodoc
class __$$SessionResponseImplCopyWithImpl<$Res>
    extends _$SessionResponseCopyWithImpl<$Res, _$SessionResponseImpl>
    implements _$$SessionResponseImplCopyWith<$Res> {
  __$$SessionResponseImplCopyWithImpl(
      _$SessionResponseImpl _value, $Res Function(_$SessionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = freezed,
    Object? gameState = null,
    Object? guestName = freezed,
    Object? history = null,
    Object? hostName = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SessionResponseImpl(
      freezed == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionResponseImpl implements _SessionResponse {
  _$SessionResponseImpl(
      [final Map<String, dynamic>? board,
      this.gameState = GameState.NotStarted,
      this.guestName,
      final List<String> history = const [],
      this.hostName = "",
      this.id = "",
      this.name = ""])
      : _board = board,
        _history = history;

  factory _$SessionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionResponseImplFromJson(json);

  final Map<String, dynamic>? _board;
  @override
  Map<String, dynamic>? get board {
    final value = _board;
    if (value == null) return null;
    if (_board is EqualUnmodifiableMapView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final GameState gameState;
  @override
  final String? guestName;
  final List<String> _history;
  @override
  @JsonKey()
  List<String> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final String hostName;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'SessionResponse(board: $board, gameState: $gameState, guestName: $guestName, history: $history, hostName: $hostName, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionResponseImpl &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_board),
      gameState,
      guestName,
      const DeepCollectionEquality().hash(_history),
      hostName,
      id,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      __$$SessionResponseImplCopyWithImpl<_$SessionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionResponseImplToJson(
      this,
    );
  }
}

abstract class _SessionResponse implements SessionResponse {
  factory _SessionResponse(
      [final Map<String, dynamic>? board,
      final GameState gameState,
      final String? guestName,
      final List<String> history,
      final String hostName,
      final String id,
      final String name]) = _$SessionResponseImpl;

  factory _SessionResponse.fromJson(Map<String, dynamic> json) =
      _$SessionResponseImpl.fromJson;

  @override
  Map<String, dynamic>? get board;
  @override
  GameState get gameState;
  @override
  String? get guestName;
  @override
  List<String> get history;
  @override
  String get hostName;
  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
