import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/lobby/use_case/i_lobby_data_source.dart';
import '../core/user_preference.dart';

@Injectable(as: ILobbyDataSource)
class LobbyDataSourceImpl implements ILobbyDataSource {
  const LobbyDataSourceImpl(this._uri);

  final Uri _uri;

  @override
  WebSocketChannel getLobbyChannel() {
    const path = '/v1/lobby/games';
    final uri = _uri.replace(scheme: 'ws', path: path, queryParameters: {
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDg4OTI2NjYsImlhdCI6MTcwODgwNjI2Niwic3ViIjoiMGY0MjhjYTUtZDExZC0xMWVlLWE0MDYtMDI0MmFjMTMwMDAyIn0.XlcqRNxQvWAeHQpLIrQLxcTauzhvlyu-Brf9WNYar5U"
    });
    return WebSocketChannel.connect(uri);
  }
}
