import 'dart:convert';
import 'package:dio/dio.dart';
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
      throw Exception('Failed to get cards');
    }
  }

  Future<ApiResponse> delete(int id) async {
    Response response;
    response = await defalutHttpClient.get('/xxx.delete.json');

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to delete card');
    }
  }
}
