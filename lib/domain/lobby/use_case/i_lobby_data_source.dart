import '../entities/lobby.dart';

abstract interface class ILobbyDataSource {
  Future<Lobby> getActiveGames();
}
