import 'package:freezed_annotation/freezed_annotation.dart';

enum EnumGameEvent {
  @JsonKey(name: 'invalid_input_event')
  invalidInputEvent,
  @JsonKey(name: '1')
  col1,
  @JsonKey(name: '2')
  col2,
  @JsonKey(name: '3')
  col3,
  roll,
  emote,
}
