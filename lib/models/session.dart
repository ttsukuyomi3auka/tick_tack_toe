import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_tack_toe/core/constants.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class SessionResponse with _$SessionResponse {

  factory SessionResponse([
    Map<String,dynamic>? board,
    @Default(GameState.NotStarted) @JsonKey(name: 'game_state') GameState gameState,
    String? guest_name,
    @Default([]) List<String> history,
    @Default('') String host_name,
    @Default("") String id,
    @Default("") String name,


  ]) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, dynamic> json) => _$SessionResponseFromJson(json);
}