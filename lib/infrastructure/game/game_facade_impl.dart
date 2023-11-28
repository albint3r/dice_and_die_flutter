import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/game/i_game_data_source.dart';
import '../../domain/game/i_game_facade.dart';

@Injectable(as: IGameFacade)
class GameFacadeImpl implements IGameFacade {
  GameFacadeImpl(this._dataSource);

  final IGameDataSource _dataSource;

  @override
  Stream<dynamic> getGameEvents(String gameId) =>
      _dataSource.getGameEvents(gameId);

  @override
  String generateRandomId() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
