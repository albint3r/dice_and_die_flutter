import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/app_user.dart';
import '../../core/types.dart';
import 'board.dart';
import 'die.dart';

part 'player.freezed.dart';

part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    @JsonKey(name: 'user') required AppUser appUser,
    required Board board,
    required Die die,
  }) = _Player;

  const Player._();

  factory Player.fromJson(Json json) => _$PlayerFromJson(json);
}
