// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionResponseImpl _$$SessionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionResponseImpl(
      json['board'] as Map<String, dynamic>?,
      $enumDecodeNullable(_$GameStateEnumMap, json['gameState']) ??
          GameState.NotStarted,
      json['guestName'] as String?,
      (json['history'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      json['hostName'] as String? ?? "",
      json['id'] as String? ?? "",
      json['name'] as String? ?? "",
    );

Map<String, dynamic> _$$SessionResponseImplToJson(
        _$SessionResponseImpl instance) =>
    <String, dynamic>{
      'board': instance.board,
      'gameState': _$GameStateEnumMap[instance.gameState]!,
      'guestName': instance.guestName,
      'history': instance.history,
      'hostName': instance.hostName,
      'id': instance.id,
      'name': instance.name,
    };

const _$GameStateEnumMap = {
  GameState.NotStarted: 'NotStarted',
  GameState.Ongoing: 'Ongoing',
  GameState.XWon: 'XWon',
  GameState.OWon: 'OWon',
  GameState.Draw: 'Draw',
};
