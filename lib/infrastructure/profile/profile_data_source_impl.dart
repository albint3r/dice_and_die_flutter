import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/profile/i_profile_data_source.dart';

@Injectable(as: IProfileDataSource)
class ProfileDataSourceImpl implements IProfileDataSource {
  ProfileDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> updateNameAndLastName(
    String name,
  ) async {
    final data = {
      "name": name,
      "last_name": "",
    };
    final response = await _dio.put(
      '/user/v1/update',
      data: data,
    );
    if (response.statusCode == 202) {
      final data = response.data as Json;
      print('*-' * 100);
      print('Done');
      print('*-' * 100);
    }
  }
}
