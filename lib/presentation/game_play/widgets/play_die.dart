import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../domain/game2/entities/player.dart';
import '../../../domain/game2/enums/enum_game_state.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/theme/const_values.dart';

class PlayDie extends StatefulWidget {
  const PlayDie({
    required this.number,
    required this.player,
    super.key,
  });

  final int? number;
  final Player player;

  @override
  State<PlayDie> createState() => _PlayDieState();
}

class _PlayDieState extends State<PlayDie> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AudioPlayer _rollDiceAudioPlayer = AudioPlayer();
  AudioPlayer _throwDiceAudioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..repeat();
    _initAudioPlayer();
  }

  void _initAudioPlayer() async {
    _rollDiceAudioPlayer = AudioPlayer();
    await _rollDiceAudioPlayer.setSource(
      AssetSource(
        'sounds/dice_random_rolling_effect.mp3',
      ),
    );
    await _throwDiceAudioPlayer.setSource(
      AssetSource(
        'sounds/dice_roll.mp3',
      ),
    );
    _rollDiceAudioPlayer.resume();
  }

  bool _isPlayerTurn(GamePlayState state) =>
      widget.player == state.game!.currentPlayer &&
      state.game!.gameState == EnumGameState.rollDice;

  void _startAnimation() {
    print('*|' * 100);
    print('_startAnimation->${widget.player}');
    print('*|' * 100);
    _rollDiceAudioPlayer.resume();
    _controller.repeat();
  }

  void _stopAnimation() {
    print('*|' * 100);
    print('_stopAnimation-> ${widget.player}');
    print('*|' * 100);
    _rollDiceAudioPlayer.stop();
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    _rollDiceAudioPlayer.dispose();
    _throwDiceAudioPlayer.dispose();
    super.dispose();
  }

  BoxDecoration buildBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.onPrimary,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      border: Border.all(
        color: colorScheme.secondary,
      ),
      boxShadow: [
        BoxShadow(
          color: colorScheme.primary,
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(1, 4),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamePlayBloc>().state;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Random random = Random();
    if (_isPlayerTurn(state)) {
      _startAnimation();
    } else {
      _stopAnimation();
    }
    return GestureDetector(
      onTap: () => context.read<GamePlayBloc>().add(
            const GamePlayEvent.rollDice(),
          ),
      child: Container(
        decoration: buildBoxDecoration(colorScheme),
        height: dieSize,
        width: dieSize,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              final int randomValue = random.nextInt(6) + 1;
              return TitleH1(
                text: _isPlayerTurn(state)
                    ? '$randomValue'
                    : '${widget.number ?? ''}',
                color: colorScheme.secondary,
              );
            },
          ),
        ),
      ),
    );
  }
}
