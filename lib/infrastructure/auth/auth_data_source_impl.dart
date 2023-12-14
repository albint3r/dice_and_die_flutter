import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_data_source.dart';
import '../../domain/auth/schemas/auth_response.dart';
import '../../domain/core/types.dart';
import 'utils.dart';

@Injectable(as: IAuthDataSource)
class AuthDataSourceImpl implements IAuthDataSource {
  AuthDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<AuthResponse> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> logInFromSessionToken(String sessionToken) async {
    final response = await _dio.post(
      '/auth/v1/login/token',
      options: FastHeader.getOptions(sessionToken),
    );
    final data = response.data as Json;
    print('*-'*100);
    print('data->$data');
    print('*-'*100);
    if (response.statusCode == 403) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 401) {
      throw Exception('Bad session token credentials');
    }
    return AuthResponse.fromJson(data);
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
