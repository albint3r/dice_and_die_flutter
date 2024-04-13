import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../auth/auth_interceptors.dart';

@module
abstract class RegisterModule {
  @singleton
  Uri getUri() {
    return Uri(
      scheme: 'http',
      host: '146.190.134.20',
      // host: 'localhost',
      // host: '192.168.1.68',
      port: 8000,
    );
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

  @injectable
  Iterable<Interceptor> getInterceptors() {
    if (kDebugMode) {
      return [
        LogInterceptor(logPrint: l.i),
        DioInterceptToCurl(),
      ];
    }
    return [];
  }

  @singleton
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

  @singleton
  FirebaseAuth getFirebaseAuth() => FirebaseAuth.instance;

  @singleton
  FirebaseAnalytics getFireAnalytics() => FirebaseAnalytics.instance;
}
