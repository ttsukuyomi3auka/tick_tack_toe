
import 'package:freezed_annotation/freezed_annotation.dart';

const String baseUrl = 'https://ttt.bulbaman.me';


enum GameState {
  @JsonValue("NotStarted")
  NotStarted,
  
  @JsonValue("Ongoing")
  Ongoing,
  
  @JsonValue("XWon")
  XWon,
  
  @JsonValue("OWon")
  OWon,
  
  @JsonValue("Draw")
  Draw
}
enum XOState {
  x,
  o,
  e,
}