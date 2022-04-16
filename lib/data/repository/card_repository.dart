import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/remote/dio_client.dart';

import '../model/response/api_response.dart';

class CardRepository {
  Future<ApiResponse> findAll() async {
    Response response;
    response = await defalutHttpClient.get(
      '/cards.get.json',
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to get users');
    }
  }

  Future<ApiResponse> update(User user) async {
    debugPrint(user.toString());
    Response response;
    response = await defalutHttpClient.get('/xxx.post.json');

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to update user');
    }
  }
}
