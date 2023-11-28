import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../domain/core/types.dart';
import '../../domain/waiting_room/i_waiting_room_data_source.dart';

@Injectable(as: IWaitingRoomDataSource)
class WaitingRoomDataSourceImpl implements IWaitingRoomDataSource {
  WaitingRoomDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> getWaitingRooms() async {
    print('*-' * 100);
    try {
      final response = await _dio.get('/v1/waiting_rooms');

      print('*-' * 100);
      print(response);
      print('*-' * 100);
      final data = response.data as Json;
    } catch (e) {
      print("Error---> $e");
    }
  }
}
