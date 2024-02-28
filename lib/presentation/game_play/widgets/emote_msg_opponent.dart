import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../domain/game2/enums/emote.dart';
import '../../../domain/game2/schemas/response.dart';
import '../../../gen/assets.gen.dart';

class EmoteMsgOpponent extends StatelessWidget {
  const EmoteMsgOpponent(this.emoteExtras);

  final ResponseEmoteExtras emoteExtras;

  Widget getEmote(Emote emote) {
    switch (emote) {
      case Emote.haha:
        return Assets.images.emotes.haha.image();
      case Emote.hello:
        return Assets.images.emotes.hello.image();
      case Emote.nice:
        return Assets.images.emotes.nice.image();
      case Emote.omg:
        return Assets.images.emotes.omg.image();
      case Emote.invalidInputEvent:
        return const SizedBox.shrink();
      case Emote.sorry:
        return Assets.images.emotes.sorry.image();
      case Emote.wow:
        return Assets.images.emotes.wow.image();
      case Emote.wtf:
        return Assets.images.emotes.wtf.image();
      case Emote.yes:
        return Assets.images.emotes.yes.image();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamePlayBloc>().state;
    return AnimatedOpacity(
      opacity: state.isVisibleOpponentEmote ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Center(
        child: getEmote(emoteExtras.emote),
      ),
    );
  }
}
