part of 'lobby_bloc.dart';

@freezed
class LobbyEvent with _$LobbyEvent {
  const factory LobbyEvent.loadLobbyGames() = _LoadLobbyGames;

  const factory LobbyEvent.updateLobbyGames() = _UpdateLobbyGames;

  const factory LobbyEvent.challengeFriend() = _ChallengeFriend;
}
