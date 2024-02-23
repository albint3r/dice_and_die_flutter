import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';

part 'game2_event.dart';

part 'game2_state.dart';

part 'game2_bloc.freezed.dart';

@injectable
class Game2Bloc extends Bloc<Game2Event, Game2State> {
  Game2Bloc() : super(Game2State.initial()) {
    on<_CreateGame>((event, emit) {
      // TODO: implement event handler
    });
    on<_JoinGame>((event, emit) {
      // TODO: implement event handler
    });
  }
}
