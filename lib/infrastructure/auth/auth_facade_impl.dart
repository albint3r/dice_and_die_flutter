import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_data_source.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/schemas/auth_response.dart';

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  AuthFacadeImpl(this._dataSource);

  final IAuthDataSource _dataSource;

  @override
  Future<AuthResponse> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> loginFromSessionToken(String sessionToken) {
    // TODO: implement loginFromSessionToken
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
