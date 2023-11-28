import 'package:injectable/injectable.dart';

import '../../domain/waiting_room/i_waiting_room_data_source.dart';
import '../../domain/waiting_room/i_waiting_room_facade.dart';

@Injectable(as: IWaitingRoomDFacade)
class WaitingRoomFacadeImpl implements IWaitingRoomDFacade {
  WaitingRoomFacadeImpl(this._dataSource);

  final IWaitingRoomDataSource _dataSource;

  @override
  Future<void> getWaitingRooms() async {
    await _dataSource.getWaitingRooms();
  }
}
