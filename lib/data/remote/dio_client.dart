import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_with_getx/constants.dart';

final defalutHttpClient = Dio(
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
