import '../waiting_room/game.dart';
import '../waiting_room/player.dart';

abstract interface class IGameLifeFacade {
  Player? getOpponentPlayer(
    Game game,
    Player player,
  );
}
