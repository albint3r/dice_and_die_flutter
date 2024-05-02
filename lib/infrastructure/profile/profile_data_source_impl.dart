import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/profile/errors/profile_error.dart';
import '../../domain/profile/i_profile_data_source.dart';
import '../../domain/profile/schemas/profile_response.dart';

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

  @override
  Future<ProfileResponse> getUserReferralProgram() async {
    try {
      final response = await _dio.post(
        '/v2/referral_program/promoter/history',
      );
      final data = response.data as Json;
      return ProfileResponse.fromJson(data);
    } catch (e) {
      throw ProfileError(
        'Get User Referral history error request.',
      );
    }
  }
}
