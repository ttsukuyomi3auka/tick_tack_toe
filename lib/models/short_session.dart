import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_tack_toe/core/constants.dart';

part 'short_session.freezed.dart';
part 'short_session.g.dart';

@freezed
class ShortSession with _$ShortSession {
  factory ShortSession({
    @Default(GameState.NotStarted) GameState gameState,
    String? guest_name,
    required String host_name,
    @Default("") String id,
    @Default("") String name,
  }) = _ShortSession;

  factory ShortSession.fromJson(Map<String, dynamic> json) =>
      _$ShortSessionFromJson(json);
}
