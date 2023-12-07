import 'package:injectable/injectable.dart';

import '../../domain/game_life/i_game_life_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';


@Injectable(as: IGameLifeFacade)
class GameLifeFacadeImpl implements IGameLifeFacade {

  @override
  Player? getOpponentPlayer(Game game, Player player) {
    return game.p1 == player ? game.p2 : game.p1;
  }
}
