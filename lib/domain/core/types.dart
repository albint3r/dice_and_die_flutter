import '../game_play/entities/game.dart';
import '../game_play/entities/player.dart';

typedef Json = Map<String, dynamic>;
typedef TActiveGames = Map<String, Game>;
typedef TColumCounter = Map<int, int>;
typedef TWinner = (Player, Player?);
typedef TIsTie = (Player, Player);
