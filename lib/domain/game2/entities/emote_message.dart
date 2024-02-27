import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../enums/emote.dart';

part 'emote_message.freezed.dart';

part 'emote_message.g.dart';

@freezed
class EmoteMessage with _$EmoteMessage {
  const factory EmoteMessage({
    required Emote emote,
  }) = _EmoteMessage;

  const EmoteMessage._();

  factory EmoteMessage.fromJson(Json json) => _$EmoteMessageFromJson(json);
}
