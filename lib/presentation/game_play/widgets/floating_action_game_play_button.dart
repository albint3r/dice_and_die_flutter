import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../domain/game2/enums/emote.dart';

class FloatingActionGamePlayButton extends StatefulWidget {
  const FloatingActionGamePlayButton({super.key});

  @override
  State<FloatingActionGamePlayButton> createState() =>
      _FloatingActionGamePlayButtonState();
}

class _FloatingActionGamePlayButtonState
    extends State<FloatingActionGamePlayButton> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SpeedDial(
      activeIcon: Icons.close,
      curve: Curves.bounceIn,
      elevation: 5,
      backgroundColor: colorScheme.onSecondary,
      overlayOpacity: .5,
      overlayColor: colorScheme.onBackground,
      openCloseDial: isDialOpen,
      switchLabelPosition: true,
      // onPress: _toggle,
      children: [
        SpeedDialChild(
          label: 'Hello',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.hello),
              ),
        ),
        SpeedDialChild(
          label: 'Help',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.help),
              ),
        ),
        SpeedDialChild(
          label: 'JaJaJa',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.jajaja),
              ),
        ),
        SpeedDialChild(
          label: 'Nice',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.nice),
              ),
        ),
        SpeedDialChild(
          label: 'Sorry',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.sorry),
              ),
        ),
        SpeedDialChild(
          label: 'Thinking',
          onTap: () => context.read<GamePlayBloc>().add(
                const GamePlayEvent.sendEmote(Emote.thinking),
              ),
        ),
      ],
      child: const Icon(Icons.chat),
    );
  }
}
