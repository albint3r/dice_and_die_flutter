part of 'game_play_bloc.dart';

@freezed
class GamePlayEvent with _$GamePlayEvent {
  const factory GamePlayEvent.createOrJoinGame(
    Game? game,
  ) = _CreateOrJoinGame;

  const factory GamePlayEvent.rollDice() = _RollDice;

  const factory GamePlayEvent.selectColumn(int index) = _SelectColumn;

  const factory GamePlayEvent.getWinnerPlayer() = _GetWinnerPlayer;

  const factory GamePlayEvent.sendEmote(Emote chatEmote) = _SendEmote;

  const factory GamePlayEvent.showEmotePlayer() = _ShowEmotePlayer;

  const factory GamePlayEvent.showEmoteOpponent() = _ShowEmoteOpponent;

  const factory GamePlayEvent.disconnect() = _Disconnect;

  const factory GamePlayEvent.challengeFriend() = _ChallengeFriend;
}
