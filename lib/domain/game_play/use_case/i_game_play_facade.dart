import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/types.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../enums/emote.dart';
import '../schemas/response.dart';

abstract interface class IGamePlayFacade {
  WebSocketChannel get channel;

  String generateRandomId();

  WebSocketChannel getGamePlayChannel(String gameId);

  WebSocketChannel getGamePlayAIChannel();

  ResponseGame loadGamePlay(dynamic data);

  void rollDice();

  void selectColumn(int index);

  void sendEmote(Emote emote);

  TWinner getWinnerPlayer(Game game, Player player);

  ResponseEmoteExtras? listeningChatMessage(ResponseGame response);
}
