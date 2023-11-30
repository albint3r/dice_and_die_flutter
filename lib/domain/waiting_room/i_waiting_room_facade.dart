import 'game.dart';

abstract interface class IWaitingRoomDFacade {
  Future<List<Game>> getWaitingRooms();
}
