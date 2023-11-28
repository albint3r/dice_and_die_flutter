import 'game.dart';

abstract interface class IWaitingRoomDataSource {
  Future<List<Game>> getWaitingRooms();
}
