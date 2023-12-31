import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../auth/auth_interceptors.dart';

@module
abstract class RegisterModule {
  @singleton
  Uri getUri() {
    const hostKey = 'HOST';
    const path = '/';
    if (const bool.hasEnvironment(hostKey)) {
      return Uri(
        scheme: 'http',
        host: const String.fromEnvironment(hostKey),
        port: 8081,
        path: path,
      );
    } else {
      return Uri.http(
        '146.190.134.20:8001',
        // '192.168.1.71:8001', //test
        path,
      );
    }
  }

  @injectable
  BaseOptions getDioBaseOptions(Uri uri) {
    final headers = {
      HttpHeaders.acceptHeader: Headers.jsonContentType,
    };

    return BaseOptions(
      baseUrl: uri.toString(),
      headers: headers,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
  }

  @lazySingleton
  Dio getDio(
    BaseOptions options,
    Iterable<Interceptor> interceptors,
    AuthInterceptors auth,
  ) {
    final dio = Dio(
      options,
    );
    dio.interceptors
      ..addAll(interceptors)
      ..add(auth);
    return dio;
  }

  @injectable
  Iterable<Interceptor> getInterceptors() {
    if (kDebugMode) {
      return [
        LogInterceptor(logPrint: l.d),
        DioInterceptToCurl(),
      ];
    }
    return [];
  }
}
