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
    const url = '/v2/auth/login';
    final response = await _dio.post(
      url,
      data: {
        'email': email,
        'password': password,
      },
    );
    return _getAuthResponse(response);
  }

  @override
  Future<AuthResponse> signIn(
    String email,
    String name,
    String password,
    String referralCode,
  ) async {
    const url = '/v2/auth/signin';
    final response = await _dio.post(
      url,
      data: {
        'email': email,
        'name': name,
        'password': password,
        'promoter_code': referralCode,
      },
    );
    return _getAuthResponse(response);
  }

  @override
  Future<AuthResponse> logInFromSessionToken(String sessionToken) async {
    final response = await _dio.post(
      '/v2/auth/login/token',
      options: FastHeader.getOptions(sessionToken),
    );
    return _getAuthResponse(response);
  }

  @override
  Future<AuthResponse> logInWithGoogle(
    String googleUserId,
  ) async {
    final response = await _dio.post(
      '/v2/auth/signin/google',
      data: {'google_user_id': googleUserId},
    );
    return _getAuthResponse(response);
  }

  Future<AuthResponse> _getAuthResponse(Response<dynamic> response) async {
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
