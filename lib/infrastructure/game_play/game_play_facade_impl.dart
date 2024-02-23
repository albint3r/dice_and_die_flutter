import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/game2/use_case/i_game_play_facade.dart';

@Injectable(as: IGamePlayFacade)
class GamePlayFacadeImpl implements IGamePlayFacade {
  @override
  WebSocketChannel getGamePlayChannel() {
    // TODO: implement getGamePlayChannel
    throw UnimplementedError();
  }

  @override
  void rollDice() {
    // TODO: implement rollDice
  }

  @override
  void selectColumn() {
    // TODO: implement selectColumn
  }

  @override
  void sendEmote() {
    // TODO: implement sendEmote
  }
}
