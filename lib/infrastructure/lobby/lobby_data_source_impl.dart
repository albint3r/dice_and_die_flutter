import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/lobby/use_case/i_lobby_data_source.dart';

@Injectable(as: ILobbyDataSource)
class LobbyDataSourceImpl implements ILobbyDataSource {
  const LobbyDataSourceImpl(this._uri);

  final Uri _uri;

  @override
  WebSocketChannel getLobbyChannel() {
    const path = '/v1/lobby/games';
    final uri = _uri.replace(scheme: 'ws', path: path);
    return WebSocketChannel.connect(uri);
  }
}
