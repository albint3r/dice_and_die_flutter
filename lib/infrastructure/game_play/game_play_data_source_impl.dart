import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../application/auth/auth_bloc.dart';
import '../../domain/game_play/use_case/i_game_play_data_source.dart';

@Injectable(as: IGamePlayDataSource)
class GamePlayDataSourceImpl implements IGamePlayDataSource {
  const GamePlayDataSourceImpl(
    this._uri,
    this._auth,
  );

  final Uri _uri;
  final AuthBloc _auth;

  @override
  WebSocketChannel getGamePlayChannel(String gameId) {
    final path = '/v2/game/$gameId';
    final uri = _uri.replace(
      scheme: 'ws',
      path: path,
      queryParameters: {'token': _auth.state.sessionToken},
    );
    return WebSocketChannel.connect(uri);
  }

  @override
  WebSocketChannel getGamePlayAIChannel() {
    const path = '/v2/game/ai';
    final uri = _uri.replace(
      scheme: 'ws',
      path: path,
      queryParameters: {'token': _auth.state.sessionToken},
    );
    return WebSocketChannel.connect(uri);
  }
}
