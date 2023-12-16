import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/schemas/auth_response.dart';

abstract interface class IGameDataSource {
  WebSocketChannel getGameChannel(
    String gameId,
    String sessionToken,
  );

  Future<AuthResponse> updateUserProfile();

}
