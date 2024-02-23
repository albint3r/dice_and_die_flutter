import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';
import '../../domain/lobby/errors/errors.dart';
import '../../domain/lobby/schemas/response.dart';
import '../../domain/lobby/use_case/i_lobby_data_source.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';

@Injectable(as: ILobbyFacade)
class LobbyFacadeImpl implements ILobbyFacade {
  LobbyFacadeImpl(this._dataSource);

  final ILobbyDataSource _dataSource;
  late WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  @override
  WebSocketChannel getLobbyChannel() {
    return _channel = _dataSource.getLobbyChannel();
  }

  @override
  ResponseLobby loadActiveGames(dynamic data) {
    try {
      final stringData = jsonDecode(data.toString()) as String;
      final jsonData = jsonDecode(stringData) as Json;
      return ResponseLobby.fromJson(jsonData);
    } catch (e) {
      throw ErrorLoadingActiveGames(
        "You cant load the active games. This is your data: $data and this is your error: $e;",
      );
    }
  }

  @override
  void updateLobbyActiveGames() => _channel.sink.add(
        '{"event": "update_games"}',
      );
}
