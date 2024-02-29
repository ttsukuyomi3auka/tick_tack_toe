import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    @Default("") String private_key,
    required User user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  factory UserResponse.withUser(User newUser) => UserResponse(user: newUser);
}

@freezed
class User with _$User {
  factory User({
    @Default(null) String? in_session,
    @Default('') String username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
