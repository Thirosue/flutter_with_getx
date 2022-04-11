import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_with_getx/constants.dart';

import '../model/response/api_response.dart';

class AuthRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.of().endpoint,
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
    ),
  );

  Future<ApiResponse> auth({
    required String email,
    required String password,
  }) async {
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
