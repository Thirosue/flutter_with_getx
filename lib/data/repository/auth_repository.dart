import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/response/api_response.dart';

class AuthRepository {
  static const String _baseUrl =
      'https://thirosue.github.io/hosting-image2/flutter_study';

  final dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: 50000,
    receiveTimeout: 100000,
    // 5s
    headers: {
      HttpHeaders.userAgentHeader: "dio",
      "api": "1.0.0",
    },
    contentType: Headers.jsonContentType,
    // Transform the response data to a String encoded with UTF8.
    // The default value is [ResponseType.JSON].
    responseType: ResponseType.plain,
  ));

  Future<ApiResponse> auth() async {
    Response response;
    response = await dio.get(
      '/auth.post.json',
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to auth');
    }
  }

  Future<ApiResponse> refresh() async {
    Response response;
    response = await dio.get(
      '/auth.post.json',
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to auth');
    }
  }
}
