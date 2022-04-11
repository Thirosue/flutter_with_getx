import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_with_getx/data/remote/dio_client.dart';

import '../model/response/api_response.dart';

class AuthRepository {
  Future<ApiResponse> auth({
    required String email,
    required String password,
  }) async {
    Response response;
    response = await defalutHttpClient.get(
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
    response = await defalutHttpClient.get(
      '/auth.post.json',
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to auth');
    }
  }
}
