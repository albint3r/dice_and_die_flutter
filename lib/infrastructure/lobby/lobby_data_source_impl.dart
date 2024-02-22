import 'package:injectable/injectable.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_data_source.dart';

@Injectable(as: ILobbyDataSource)
class LobbyDataSourceImpl implements ILobbyDataSource {
  const LobbyDataSourceImpl(this._uri);

  final Uri _uri;

  @override
  Future<Lobby> getActiveGames() {
    // TODO: implement getActiveGames
    throw UnimplementedError();
  }
}
