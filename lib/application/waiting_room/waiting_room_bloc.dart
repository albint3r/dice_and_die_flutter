import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/i_waiting_room_facade.dart';

part 'waiting_room_bloc.freezed.dart';
part 'waiting_room_event.dart';
part 'waiting_room_state.dart';

@injectable
class WaitingRoomBloc extends Bloc<WaitingRoomEvent, WaitingRoomState> {
  WaitingRoomBloc(IWaitingRoomDFacade facade)
      : super(WaitingRoomState.initial()) {
    on<_Started>((event, emit) async {
      final games = await facade.getWaitingRooms();
      emit(
        state.copyWith(
          isLoading: false,
          games: games,
        ),
      );
    });
  }
}