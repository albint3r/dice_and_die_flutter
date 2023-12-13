import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_data_source.dart';
import '../../domain/auth/schemas/auth_response.dart';

@Injectable(as: IAuthDataSource)
class AuthDataSourceImpl implements IAuthDataSource {
  @override
  Future<AuthResponse> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> logInFromSessionToken(String sessionToken) {
    // TODO: implement logInFromSessionToken
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
