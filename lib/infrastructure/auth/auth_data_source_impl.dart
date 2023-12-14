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
  Future<AuthResponse> logIn(String email, String password) async {
    final response = await _dio.post(
      '/auth/v1/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    final data = response.data as Json;
    if (response.statusCode == 403) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 401) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 409) {
      throw Exception('User already Exist.');
    }
    if (response.statusCode == 422) {
      throw Exception('Validation Error');
    }
    return AuthResponse.fromJson(data);
  }

  @override
  Future<AuthResponse> logInFromSessionToken(String sessionToken) async {
    final response = await _dio.post(
      '/auth/v1/login/token',
      options: FastHeader.getOptions(sessionToken),
    );
    final data = response.data as Json;
    if (response.statusCode == 403) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 401) {
      throw Exception('Bad session token credentials');
    }
    return AuthResponse.fromJson(data);
  }

  @override
  Future<AuthResponse> signIn(String email, String password) async {
    final response = await _dio.post(
      '/auth/v1/signin',
      data: {
        'email': email,
        'password': password,
      },
    );
    final data = response.data as Json;
    if (response.statusCode == 403) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 401) {
      throw Exception('Bad session token credentials');
    }
    if (response.statusCode == 409) {
      throw Exception('User already Exist.');
    }
    if (response.statusCode == 422) {
      throw Exception('Validation Error');
    }
    return AuthResponse.fromJson(data);
  }
}
