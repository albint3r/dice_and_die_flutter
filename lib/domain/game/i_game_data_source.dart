import '../waiting_room/game.dart';

abstract interface class IGameDataSource {
  Stream<dynamic> getGameEvents(String gameId);

  Future<void> disconnect(String gameId);
}
