import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/auth/schemas/auth_response.dart';
import '../../domain/core/types.dart';
import '../../domain/game/i_game_data_source.dart';

@Injectable(as: IGameDataSource)
class GameDataSourceImpl implements IGameDataSource {
  GameDataSourceImpl(this._dio, this._uri);

  final Dio _dio;
  final Uri _uri;

  @override
  WebSocketChannel getGameChannel(
    String gameId,
    String sessionToken,
  ) {
    final path = '/ws/v1/game/$gameId/$sessionToken';
    final uri = _uri.replace(scheme: 'ws', path: path);
    return WebSocketChannel.connect(uri);
  }

  @override
  Future<AuthResponse> updateUserProfile() async {
    final response = await _dio.post(
      '/auth/v1/login/token',
    );
    final data = response.data as Json;
    if (response.statusCode == 403) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 401) {
      throw Exception('Bad session token credentials');
    }
    return AuthResponse.fromJson(data);
  }
}
