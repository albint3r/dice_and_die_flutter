import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/auth/schemas/auth_response.dart';
import '../../domain/core/types.dart';
import '../../domain/game/i_game_data_source.dart';
import '../../presentation/core/theme/const_values.dart';

@Injectable(as: IGameDataSource)
class GameDataSourceImpl implements IGameDataSource {

  GameDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  WebSocketChannel getGameChannel(
    String gameId,
    String sessionToken,
  ) {
    final uri = Uri.parse('$websocketUri/ws/v1/game/$gameId/$sessionToken');
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
