import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/profile/i_profile_data_source.dart';

@Injectable(as: IProfileDataSource)
class ProfileDataSourceImpl implements IProfileDataSource {
  ProfileDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> updateNameAndLastName(
    String name,
    String lastName,
  ) {
    // TODO: implement updateNameAndLastName
    throw UnimplementedError();
  }
}
