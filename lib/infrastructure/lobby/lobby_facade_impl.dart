import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';
import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/schemas/response.dart';
import '../../domain/lobby/use_case/i_lobby_data_source.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';

@Injectable(as: ILobbyFacade)
class LobbyFacadeImpl implements ILobbyFacade {
  LobbyFacadeImpl(this._dataSource);

  final ILobbyDataSource _dataSource;
  late final WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  @override
  WebSocketChannel getLobbyChannel() {
    return _channel = _dataSource.getLobbyChannel();
  }

  @override
  void loadActiveGames(dynamic data) {
    print('*-' * 100);
    print('data -> $data');
    print('type -> ${data.runtimeType}');
    final response = jsonDecode(data.toString()) as String;
    print('response -> $response');
    print('type -> ${response.runtimeType}');
    print('*-' * 100);
    final response2 = jsonDecode(response);
    print('response2 -> $response2');
    print('type -> ${response2.runtimeType}');
    final x = Lobby.fromJson(response2 as Json);
    print('x-> $x');
    print('*-' * 100);
  }
}
