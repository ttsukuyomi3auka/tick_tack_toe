// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponceImpl _$$UserResponceImplFromJson(Map<String, dynamic> json) =>
    _$UserResponceImpl(
      private_key: json['private_key'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponceImplToJson(_$UserResponceImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id_session: json['id_session'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id_session': instance.id_session,
      'username': instance.username,
    };
