// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShortSessionImpl _$$ShortSessionImplFromJson(Map<String, dynamic> json) =>
    _$ShortSessionImpl(
      gameState: $enumDecodeNullable(_$GameStateEnumMap, json['gameState']) ??
          GameState.NotStarted,
      guest_name: json['guest_name'] as String?,
      host_name: json['host_name'] as String,
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$$ShortSessionImplToJson(_$ShortSessionImpl instance) =>
    <String, dynamic>{
      'gameState': _$GameStateEnumMap[instance.gameState]!,
      'guest_name': instance.guest_name,
      'host_name': instance.host_name,
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
