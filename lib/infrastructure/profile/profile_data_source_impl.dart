import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/profile/i_profile_data_source.dart';

@Injectable(as: IProfileDataSource)
class ProfileDataSourceImpl implements IProfileDataSource {
  ProfileDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<String> updateName(
    String name,
  ) async {
    try {
      final response = await _dio.put(
        '/v2/auth/profile',
        data: {
          "name": name,
          "last_name": "",
        },
      );
      final data = response.data as Json;
      final userData = data['user'] as Json;
      return userData['name'] as String;
    } catch (e) {
      throw Exception(
        'Update name request have errors. Check your submission.',
      );
    }
  }
}
