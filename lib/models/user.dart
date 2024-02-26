import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserResponce with _$UserResponce {
  factory UserResponce({
    required String private_key,
    required User user,
  }) = _UserResponce;

  factory UserResponce.fromJson(Map<String, dynamic> json) =>
      _$UserResponceFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    required String id_session,
    required String username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
