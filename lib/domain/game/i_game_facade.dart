import '../waiting_room/game.dart';

abstract interface class IGameFacade {
  Stream<dynamic> getGameEvents(String gameId);

  String generateRandomId();
}
