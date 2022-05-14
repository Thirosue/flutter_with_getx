import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/model/response/api_response.dart';

const dummy = '''
{
  "data": [
    {
      "id": "demo",
      "first_name": "john",
      "last_name": "doe",
      "email": "sample@exsample.com",
      "tel": "09012345678",
      "roles": [
        "system_admin"
      ],
      "permission_key_list": [
        ".*"
      ],
      "idToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
    }
  ],
  "message": "正常終了"
}
''';

class DummyResponse {
  static Future<ApiResponse> getAuthPostResponse() async {
    String json = 'dummy';
    try {
      // read file sample
      json = await File('${Directory.current.path}/test/dummy/auth.post.json')
          .readAsString();
    } on Exception catch (e) {
      json = dummy;
    }
    return ApiResponse.fromJson(jsonDecode(json));
  }
}
