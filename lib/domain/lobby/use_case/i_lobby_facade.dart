import '../entities/lobby.dart';

abstract interface class ILobbyFacade {
  Future<Lobby> loadActiveGames();
}
