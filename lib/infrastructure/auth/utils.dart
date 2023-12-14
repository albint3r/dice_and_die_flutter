import 'package:dio/dio.dart';

class FastHeader {
  static Options getOptions(String sessionToken) {
    final headers = {
      "accept": "application/json",
      'Authorization': 'Bearer $sessionToken',
    };
    return Options(headers: headers);
  }
}
