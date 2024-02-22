import 'package:injectable/injectable.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_data_source.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';

@Injectable(as: ILobbyFacade)
class LobbyFacadeImpl implements ILobbyFacade {
  const LobbyFacadeImpl(this._dataSource);

  final ILobbyDataSource _dataSource;

  @override
  Future<Lobby> loadActiveGames() {
    // TODO: implement loadActiveGames
    throw UnimplementedError();
  }
}
