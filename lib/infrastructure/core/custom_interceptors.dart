import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import 'user_preference.dart';

@injectable
class CustomInterceptors extends Interceptor {
  CustomInterceptors(this._userPreference);

  final UserPreference _userPreference;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    l.d('REQUEST[${options.method}] => PATH: ${options.path}');
    // If Token exist add header to
    final sessionToken = await _userPreference.getSessionToken();
    if (sessionToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $sessionToken';
      l.d('headers[${options.headers}]');
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    l.d('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    l.d('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
